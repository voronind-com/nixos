{ container, lib, ... } @args: let
	cfg = container.config.postgres;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.postgres = container.mkContainer cfg {
		bindMounts = {
			"/var/lib/postgresql/data" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = false;
			};
		};

		config = { pkgs, ... }: container.mkContainerConfig cfg {
			services.postgresql = let
				# Populate with services here.
				configurations = with container.config; {
					gitea       = git;
					nextcloud   = cloud;
					privatebin  = paste;
					onlyoffice  = office;
					paperless   = paper;
					vaultwarden = pass;
					invidious   = yt;
				};

				access = configurations // {
					all = { address = container.host; };
				};

				authentication = builtins.foldl' (acc: item: acc + "${item}\n") "" (
					lib.mapAttrsToList (db: cfg: "host ${db} ${db} ${cfg.address}/32 trust") access
				);

				ensureDatabases = [ "root" ] ++ lib.mapAttrsToList (name: _: name) configurations;

				ensureUsers = map (name: {
					inherit name;
					ensureClauses = if name == "root" then {
						superuser  = true;
						createrole = true;
						createdb   = true;
					} else {};
					ensureDBOwnership = true;
				}) ensureDatabases;
			in {
				inherit authentication ensureDatabases ensureUsers;

				enable = true;
				package = pkgs.postgresql_14;
				dataDir = "/var/lib/postgresql/data/14";
				enableTCPIP = true;
			};
		};
	};
}
