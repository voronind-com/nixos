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
			android-studio jetbrains.idea-community
			appimage-run
			blender-hip
			bottles dxvk gamescope mangohud vkd3d wine64
			calibre
			gimp
			godot gdtoolkit
			gradience
			jellyfin-media-player
			mpv
			obs-studio
			onlyoffice-bin
			scanmem
			steam-run
			tor-browser
		];

		variables = {
			# MangoHud.
			MANGOHUD = "1";
			MANGOHUD_CONFIGFILE  = ./mangohud/MangoHud.conf;
			MANGOHUD_PRESETSFILE = ./mangohud/MangoPresets.conf;

			# Proton.
			WINEFSYNC = "1";
		};
	};

	# Special packages.
	programs.steam.enable = true;
}
