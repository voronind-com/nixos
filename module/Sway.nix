{ pkgs, lib, ... }: {
	# GUI.
	services.xserver.enable = true;
	services.xserver.xkb = {
		layout  = "us,ru";
		options = "grp:caps_toggle,lv3:ralt_switch";
	};

	# Specify default apps.
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

	# Extra apps.
	services.gnome.gnome-keyring.enable = lib.mkForce false;
	environment.systemPackages = with pkgs; [
		wl-clipboard
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

	environment.variables = {
		FOOT_CONFIG = ./sway/Foot.ini;
	};
}
