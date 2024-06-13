{ container, pkgs, util, ... } @args: let
	cfg = container.config.home;
	package = (pkgs.callPackage ./homer args);
in {
	containers.home = container.mkContainer cfg {
		config = { ... }: container.mkContainerConfig cfg {
			environment.systemPackages = [ package ];
			systemd.packages = [ package ];

			services.nginx = {
				enable = true;
				virtualHosts.${cfg.domain} = container.mkServer {
					default = true;
					root = "${package}";

					locations = {
						"/".extraConfig = ''
							try_files $uri $uri/index.html;
						'';
					};
				};
			};
		};
	};
}
