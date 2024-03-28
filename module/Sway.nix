{ pkgs, lib, ... }: {
	imports = [
		./desktop/App.nix
		./desktop/Dconf.nix
		./desktop/Sound.nix
	];

	xdg.mime.defaultApplications = {
		# Use `file -i file.txt` to find file mime type.
		# Use `xdg-mime query default "text/plain"` to find default app.
		"application/pdf" = "org.gnome.Evince.desktop"; # TODO: Different apps?
		"application/vnd.openxmlformats-officedocument.*" = "onlyoffice-desktopeditors.desktop";
		"audio/*" = "mpv.desktop";
		"image/*" = "org.gnome.Loupe.desktop";
		"text/*"  = "nvim.desktop";
		"video/*" = "mpv.desktop";
	};

	# Extra apps.
	services.gnome.gnome-keyring.enable = lib.mkForce false;
	environment.systemPackages = with pkgs; [
		grim         # Screenshot.
		mako         # Notification system.
		pamixer      # Audio.
		pavucontrol  # Audio.
		pulseaudio   # Audio.
		slurp        # Screenshot.
		wl-clipboard # Clipboard.
	];

	# Sway.
	programs.sway = {
		enable = true;
		wrapperFeatures = {
			base = true;
			gtk  = true;
		};
		extraOptions = [
			"--config=${./sway/Config}"
		];
	};

	# Portals.
	xdg.portal.wlr = {
		enable = true;
	};

	# Brightness control.
	programs.light.enable = true;

	# Configs.
	environment.variables = {
		FOOT_CONFIG = ./foot/Foot.ini;
		SWAY_CONFIG = ./sway/module;
	};

	# Extra performance.
	security.pam.loginLimits = [
		{ domain = "@users"; item = "rtprio"; type = "-"; value = 1; }
	];
}
