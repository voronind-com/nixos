{ container, ... } @args: let
	cfg = container.config.pass;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.pass = container.mkContainer cfg {
		bindMounts = {
			"/var/lib/bitwarden_rs" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = false;
			};
		};

		config = { ... }: container.mkContainerConfig cfg {
			services.vaultwarden = {
				enable          = true;
				dbBackend       = "sqlite";
				environmentFile = "/var/lib/bitwarden_rs/Env";
				config = {
					# DATABASE_URL      = "postgresql://vaultwarden:vaultwarden@${container.config.postgres.address}:${toString container.config.postgres.port}/vaultwarden";
					DATA_FOLDER       = "/var/lib/bitwarden_rs";
					DOMAIN            = "http://${cfg.domain}";
					SIGNUPS_ALLOWED   = false;
					WEB_VAULT_ENABLED = true;
					ROCKET_ADDRESS = cfg.address;
					ROCKET_PORT    = cfg.port;
				};
			};
		};
	};
}
