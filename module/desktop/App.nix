{ pkgs, ... } @args: let
	mangohud = import ./mangohud args;
in {
	xdg.mime.defaultApplications = {
		# Use `file -i file.txt` to find file mime type.
		# Use `xdg-mime query default "text/plain"` to find default app.
		"application/pdf" = "org.gnome.Evince.desktop";
		"application/vnd.openxmlformats-officedocument.*" = "onlyoffice-desktopeditors.desktop";
		"audio/*" = "mpv.desktop";
		"image/*" = "org.gnome.Loupe.desktop";
		"text/*"  = "nvim.desktop";
		"video/*" = "mpv.desktop";
	};

	hardware.opengl = let
		packages = with pkgs; [
			dxvk
			gamescope
			pkgs.mangohud
			vkd3d
		];
	in {
		extraPackages   = packages;
		extraPackages32 = packages;
	};

	environment = {
		systemPackages = with pkgs; [
			android-studio jetbrains.idea-community
			appimage-run
			blender-hip
			bottles dxvk gamescope pkgs.mangohud vkd3d wine64
			calibre
			gimp
			godot_4
			jellyfin-media-player
			(mpv.override {scripts = [mpvScripts.mpris];})
			obs-studio
			onlyoffice-bin
			scanmem
			steam-run
			tor-browser
		];

		variables = {
			# MangoHud.
			MANGOHUD = "1";
			MANGOHUD_CONFIGFILE  = pkgs.writeText "mangoConfig" mangohud.config;
			MANGOHUD_PRESETSFILE = pkgs.writeText "mangoPreset" mangohud.presets;

			# Proton.
			WINEFSYNC = "1";
		};
	};

	# Special packages.
	programs.steam.enable = true;
}
