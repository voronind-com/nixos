{ container, ... } @args: let
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
				databases = [
					"privatebin"
					"nextcloud"
				];
			in {
				enable = true;
				package = pkgs.postgresql_14;
				dataDir = "/var/lib/postgresql/data/14";
				enableTCPIP = true;
				authentication = ''
					host all all ${container.host}/32 trust
					host privatebin privatebin ${container.config.paste.address}/32 trust
					host nextcloud nextcloud ${container.config.cloud.address}/32 trust
				'';
				ensureDatabases = databases;
				ensureUsers = map (name: {
					inherit name;
					ensureDBOwnership = true;
				}) databases;
			};
		};
	};
}
