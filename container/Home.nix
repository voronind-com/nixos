{ container, pkgs, util, ... } @args: let
	cfg = container.config.home;
	package = (pkgs.callpackage ./homer args);
in {
	containers.home = container.mkContainer cfg {
		config = { ... }: container.mkContainerConfig cfg {
			environment.systempackages = [ package ];
			systemd.packages = [ package ];

			services.nginx = {
				enable = true;
				virtualhosts.${cfg.domain} = container.mkserver {
					default = true;
					root = "${package}";

					locations = {
						"/".extraconfig = ''
							try_files $uri $uri/index.html;
						'';
					};
				};
			};
		};
	};
}
