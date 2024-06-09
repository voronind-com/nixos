# ISSUE: Broken, can't read/write sda device.
{ container, ... } @args: let
	cfg = container.config.hdd;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.hdd = container.mkContainer cfg {
		# bindMounts = let
		# 	attachDrive = hostPath: {
		# 		inherit hostPath;
		# 		isReadOnly = false;
		# 	};
		# in {
		# 	"/opt/scrutiny" = {
		# 		hostPath   = "${cfg.storage}/data";
		# 		isReadOnly = false;
		# 	};
		# 	"/dev/sda" = attachDrive "/dev/sda";
		# };

		# allowedDevices = [
		# 	{
		# 		modifier = "rwm";
		# 		node     = "/dev/sda";
		# 	}
		# ];

		# additionalCapabilities = [ "CAP_SYS_ADMIN" ];

		config = { pkgs, ... }: container.mkContainerConfig cfg {
			environment.systemPackages = with pkgs; [ smartmontools ];

			services.scrutiny = {
				enable = true;
				settings.web = {
					listen = {
						host = cfg.address;
						port = cfg.port;
					};
				};
			};
		};
	};
}
