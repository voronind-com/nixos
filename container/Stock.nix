{ container, ... } @args: let
	cfg = container.config.stock;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.stock = container.mkContainer cfg {
		bindMounts = {
			"/var/lib/grocy" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = false;
			};
		};

		config = { ... }: container.mkContainerConfig cfg {
			services.grocy = {
				enable = true;
				dataDir  = "/var/lib/grocy";
				hostName = cfg.domain;
				nginx.enableSSL = false;
				settings = {
					calendar = {
						firstDayOfWeek = 1;
						showWeekNumber = true;
					};
					culture  = "en";
					currency = "RUB";
				};
			};
		};
	};
}
