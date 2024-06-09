{ container, domain, ... } @args: let
	cfg = container.config.ddns;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.ddns = container.mkContainer cfg {
		bindMounts = {
			"/data" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = true;
			};
		};

		config = { ... }: container.mkContainerConfig cfg {
			services.cloudflare-dyndns = {
				enable        = true;
				apiTokenFile  = "/data/token";
				deleteMissing = true;
				ipv4          = true;
				ipv6          = false;
				proxied       = false;
				domains = [ domain ] ++ map (sub: "${sub}.${domain}") [
					"cloud"
					"git"
					"mail"
					"office"
					"paste"
					"play"
					"vpn"
				];
			};
		};
	};
}
