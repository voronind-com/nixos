{ container, pkgs, util, ... } @args: let
	cfg = container.config.redis;
in {
	containers.redis = container.mkContainer cfg {
		config = { ... }: container.mkContainerConfig cfg {
			services.redis.servers.main = {
				enable = true;
				port = cfg.port;
				bind = cfg.address;
				extraParams = [ "--protected-mode no" ];
			};
		};
	};
}

