{ container, ... } @args: let
	cfg = container.config.cloud;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.cloud = container.mkContainer cfg {
		bindMounts = {
			"/var/www/html" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = false;
			};
		};

		config = { pkgs, config, ... }: container.mkContainerConfig cfg {
			environment.systemPackages = [ pkgs.postgresql ];
			services.nextcloud = {
				enable = true;
				# package = pkgs.nextcloud29;
				hostName = cfg.domain;
				# phpOptions = {
				# 	memory_limit = lib.mkForce "20G";
				# };
				config = {
					adminuser     = "root";
					adminpassFile = "${pkgs.writeText "NextcloudPassword" "root"}";

					dbhost     = container.config.postgres.address;
					dbname     = "nextcloud";
					dbpassFile = "${pkgs.writeText "NextcloudDbPassword" "nextcloud"}";
					dbtype     = "pgsql";
					dbuser     = "nextcloud";
				};
				extraApps = {
					inherit (config.services.nextcloud.package.packages.apps) contacts calendar onlyoffice;
				};
				extraAppsEnable = true;
				settings = {
					trusted_domains = [ cfg.address ];
					trusted_proxies = [ container.config.proxy.address ];
				};
			};
		};
	};
}
