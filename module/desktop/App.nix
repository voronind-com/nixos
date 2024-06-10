{ pkgs, ... } @args: let
	mangohud = import ./mangohud args;
in {
	imports = [
		./firefox
	];

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
			adwsteamgtk              # Steam GTK theme. Need to run the app to apply.
			appimage-run             # Tool to run .AppImage files in NixOS.
			aseprite                 # Pixel Art draw app. WARNING: Always builds from source.
			blanket                  # Sounds generator.
			blender-hip              # Blender with HiP support.
			calibre                  # Book library manager.
			evince                   # Document viewer.
			gimp                     # Image manipulation program.
			gnome.adwaita-icon-theme # GTK icons.
			gnome.gnome-calculator   # Calculator.
			gnome.gnome-font-viewer  # Font viewer.
			gnome.nautilus           # File manager.
			godot_4                  # Game development engine.
			jellyfin-media-player    # Jellyfin client (self-hosted Netflix).
			loupe                    # Image viewer.
			obs-studio               # Streaming/recording app.
			onlyoffice-bin           # Office documents app suite.
			steam-run                # Run native apps in Steam environment, like Minecraft. For Windows games use Bottles.
			tor-browser              # Privacy browser.

			android-studio jetbrains.idea-community           # JetBrans IDEs.
			bottles dxvk gamescope pkgs.mangohud vkd3d wine64 # Gaming!
			(mpv.override {scripts = [mpvScripts.mpris];})    # Media player.
		];

		variables = {
			# MangoHud.
			MANGOHUD = "1";
			MANGOHUD_CONFIGFILE  = pkgs.writeText "mangoConfig" mangohud.config;
			MANGOHUD_PRESETSFILE = pkgs.writeText "mangoPreset" mangohud.presets;

			# Proton.
			WINEFSYNC = "1";

			# GTK apps compat.
			GTK_CSD = 0;
		};
	};

	# File manager file previews.
	services.gnome.sushi.enable = true;

	# File manager network features.
	services.gvfs.enable = true;

	# Special packages.
	programs.steam.enable = true;
}
