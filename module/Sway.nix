{ pkgs, lib, ... }: {
	# Specify default apps.
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
		slurp        # Screenshot.
		wl-clipboard # Clipboard.
	];

	# Sound.
	sound.enable = true;
	hardware.pulseaudio.enable = false;
	security.rtkit.enable      = true;
	services.pipewire = {
		enable            = true;
		alsa.enable       = true;
		alsa.support32Bit = true;
		pulse.enable      = true;
	};

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

	# Brightness control.
	programs.light.enable = true;

	# Configs.
	environment.variables = {
		FOOT_CONFIG = ./foot/Foot.ini;
		SWAY_CONFIG = ./sway/module;
	};

	# Dconf.
# 	programs.dconf.enable = true;
# 	programs.dconf.profiles.user = {
# 		enableUserDb = true; # Delete `~/.config/dconf/user` to reset user settings.
# 		databases = [{
# 			settings = with lib.gvariant; {
# 				"org/gnome/desktop/a11y" = {
# 					always-show-universal-access-status = true;
# 				};
# 			};
# 		}];
# 	};
}
