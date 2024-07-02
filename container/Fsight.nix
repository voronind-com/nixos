{ container, pkgs, config, lib, util, ... }: with lib; let
	cfg = config.container.module.fsight;
	hostConfig = config;
in {
	options = {
		container.module.fsight = {
			enable = mkEnableOption "Fsight temporary servers.";
			address = mkOption {
				default = "10.1.0.29";
				type    = types.str;
			};
			# port = mkOption {
			# 	default = 3000;
			# 	type    = types.int;
			# };
			# domain = mkOption {
			# 	default = "git.${config.container.domain}";
			# 	type    = types.str;
			# };
			storage = mkOption {
				default = "${config.container.storage}/fsight";
				type    = types.str;
			};
		};
	};

	config = mkIf cfg.enable {
		systemd.tmpfiles.rules = container.mkContainerDir cfg [
			"git"
			"cloud"
			"postgres"
		];

		containers.fsight = container.mkContainer cfg {
			bindMounts = {
				"/var/lib/gitea" = {
					hostPath   = "${cfg.storage}/git";
					isReadOnly = false;
				};
				"/var/lib/postgresql" = {
					hostPath   = "${cfg.storage}/postgres";
					isReadOnly = false;
				};
				"/var/lib/nextcloud" = {
					hostPath   = "${cfg.storage}/cloud";
					isReadOnly = false;
				};
			};

			config = { config, ... }: container.mkContainerConfig cfg {
				environment.systemPackages = with pkgs; [ gitea postgresql ];

				services.gitea = let
					domain = "fmp-git.${hostConfig.container.domain}";
				in {
					enable = true;
					stateDir = "/var/lib/gitea";

					database = {
						type = "postgres";
						# host = postgre.address;
						# port = postgre.port;
						user = "gitea";
						name = "gitea";
						createDatabase = true;
					};

					settings = let
						gcArgs    = "--aggressive --no-cruft --prune=now";
						gcTimeout = 600;
					in {
						"service".DISABLE_REGISTRATION = true;
						"log".LEVEL = "Error";
						"server" = {
							DISABLE_SSH = true;
							DOMAIN      = domain;
							HTTP_ADDR   = cfg.address;
							ROOT_URL    = "https://${domain}";
						};
						"ui" = {
							AMBIGUOUS_UNICODE_DETECTION = false;
						};
						"service.explore" = {
							REQUIRE_SIGNIN_VIEW = true;
						};
						"repository" = {
							DEFAULT_PRIVATE = "private";
							DEFAULT_PUSH_CREATE_PRIVATE = true;
						};
						"repository.pull-request".DEFAULT_MERGE_STYLE = "rebase";
						"repository.issue".MAX_PINNED = 99999;
						"cron" = {
							ENABLED      = true;
							RUN_AT_START = true;
						};
						"repo-archive".ENABLED = false;
						"cron.update_mirrors".SCHEDULE = "@midnight";
						"cron.cleanup_actions".ENABLED = true;
						"cron.git_gc_repos" = {
							ENABLED  = true;
							SCHEDULE = "@midnight";
							TIMEOUT  = gcTimeout;
							ARGS     = gcArgs;
						};
						"git" = {
							GC_ARGS = gcArgs;
						};
						"git.timeout".GC = gcTimeout;
					};
				};

				services.nextcloud = let
					domain = "fmp-cloud.${hostConfig.container.domain}";
				in {
					enable = true;
					# package = pkgs.nextcloud29;
					hostName = domain;
					# phpOptions = {
					# 	memory_limit = lib.mkForce "20G";
					# };
					config = {
						adminuser     = "root";
						adminpassFile = "${pkgs.writeText "NextcloudPassword" "root"}";

						# dbhost     = postgres.address;
						dbname     = "nextcloud";
						dbpassFile = "${pkgs.writeText "NextcloudDbPassword" "nextcloud"}";
						dbtype     = "pgsql";
						dbuser     = "nextcloud";
					};
					extraApps = {
						inherit (config.services.nextcloud.package.packages.apps) deck notes onlyoffice;
					};
					extraAppsEnable = true;
					settings = {
						trusted_domains = [ domain ];
						trusted_proxies = [ hostConfig.container.module.proxy.address ];
						allow_local_remote_servers = true;
					};
				};

				services.postgresql = let
					authentication = util.trimTabs ''
						local all all trust
						host all all 0.0.0.0/0 trust
					'';

					ensureDatabases = [
						"root"
						"gitea"
						"nextcloud"
					];

					ensureUsers = [
						{
							name = "root";
							ensureClauses = {
								superuser  = true;
								createrole = true;
								createdb   = true;
							};
							ensureDBOwnership = true;
						} {
							name = "gitea";
							ensureClauses = {
								createrole = true;
								createdb   = true;
							};
							ensureDBOwnership = true;
						} {
							name = "nextcloud";
							ensureClauses = {
								createrole = true;
								createdb   = true;
							};
							ensureDBOwnership = true;
						}
					];
				in {
					inherit authentication ensureDatabases ensureUsers;

					enable      = true;
					package     = pkgs.postgresql_16;
					dataDir     = "/var/lib/postgresql/data/16";
					enableTCPIP = true;

					# NOTE: Debug mode.
					# settings = {
					# 	log_connections    = true;
					# 	log_destination    = lib.mkForce "syslog";
					# 	log_disconnections = true;
					# 	log_statement      = "all";
					# 	logging_collector  = true;
					# };
				};
			};
		};
	};
}
