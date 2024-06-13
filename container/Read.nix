{ container, lib, ... } @args: let
	cfg = container.config.read;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.read = container.mkContainer cfg {
		bindMounts = {
			"/var/lib/kavita" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = false;
			};
		}
		// container.attachMedia "book"  cfg.book  true
		// container.attachMedia "manga" cfg.manga true
		;

		config = { pkgs, ... }: container.mkContainerConfig cfg {
			services.kavita = {
				enable  = true;
				dataDir = "/var/lib/kavita";
				tokenKeyFile = pkgs.writeText "KavitaToken" "xY19aQOa939/Ie6GCRGbubVK8zRwrgBY/20AuyMpYshUjwK1Uyl7bw1yknVh6jJIFIfwq2vAjeotOUq7NEsf9Q==";
				settings = {
					IpAddresses = cfg.address;
					Port        = cfg.port;
				};
			};
		};
	};
}
