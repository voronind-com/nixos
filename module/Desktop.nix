{ pkgs, ... }: {
	hardware.opengl = let
		packages = with pkgs; [
			dxvk
			gamescope
			mangohud
			vkd3d
		];
	in {
		extraPackages   = packages;
		extraPackages32 = packages;
	};

	environment = {
		systemPackages = with pkgs; [
			adwsteamgtk
			android-studio
			blender-hip
			bottles
			dxvk
			gamescope
			gimp
			gradience
			jellyfin
			jetbrains.idea-community
			mangohud
			obs-studio
			onlyoffice-bin
			tor-browser
			vkd3d
		];

		variables = {
			# MangoHud.
			MANGOHUD = "1";
			MANGOHUD_CONFIGFILE  = "/etc/mangohud/MangoHud.conf";
			MANGOHUD_PRESETSFILE = "/etc/mangohud/MangoPresets.conf";

			# Proton.
			WINEFSYNC = "1";
		};

		etc.mangohud.source = ./mangohud;
	};

	# Special packages.
	programs.steam.enable = true;
}
