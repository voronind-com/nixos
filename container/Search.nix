{ container, pkgs, ... } @args: let
	cfg = container.config.search;
in {
	containers.search = container.mkContainer cfg {
		config = { ... }: container.mkContainerConfig cfg {
			services.searx = {
				enable = true;
				package = pkgs.searxng;
				settings = {
					server = {
						bind_address = cfg.address;
						port         = cfg.port;
						secret_key   = "searxxx";
					};
				};
			};
		};
	};
}
