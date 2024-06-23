{ container, pkgs, ... } @args: let
	cfg = container.config.yt;
in {
	containers.yt = container.mkContainer cfg {
		config = { ... }: container.mkContainerConfig cfg {
			services.invidious = {
				enable = true;
				domain = cfg.domain;
				port   = cfg.port;
				nginx.enable = false;
				database = {
					port = container.config.postgres.port;
					host = container.config.postgres.address;
					createLocally = false;
					passwordFile = "${pkgs.writeText "InvidiousDbPassword" "invidious"}";
				};
				settings = {
					admins               = [ "root" ];
					captcha_enabled      = false;
					check_tables         = true;
					registration_enabled = false;
					external_port        = 443;
					https_only           = true;
				};
			};
		};
	};
}
