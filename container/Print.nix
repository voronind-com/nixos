# NOTE: Login to contaier, run passwd and use that root/pw combo for administration. `AllowFrom = all` doesn't seem to work.

# ipp://192.168.2.237
# Pantum M6500W-Series
{ container, pkgs, ... } @args: let
	cfg     = container.config.print;
	package = pkgs.callPackage ./print args;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.print = container.mkContainer cfg {
		bindMounts = {
			"/var/lib/cups" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = false;
			};
		};

		config = { ... }: container.mkContainerConfig cfg {
			services.printing = {
				enable          = true;
				allowFrom       = [ "all" ];
				browsing        = true;
				defaultShared   = true;
				drivers         = [ package ];
				listenAddresses = [ "${cfg.address}:${toString cfg.port}" ];
				startWhenNeeded = true;
				stateless       = false;
				webInterface    = true;
			};
		};
	};
}

