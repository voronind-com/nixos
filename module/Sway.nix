{ pkgs, lib, ... }: {
	imports = [
		./desktop/App.nix
		./desktop/Bluetooth.nix
		./desktop/Brightness.nix
		./desktop/Dconf.nix
		./desktop/Portal.nix
		./desktop/Realtime.nix
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

	services.gnome.gnome-keyring.enable = lib.mkForce false;
	environment.systemPackages = with pkgs; [
		grim slurp # Screenshot.
		mako # Notification system.
		networkmanagerapplet # Internet configuration.
		pamixer pavucontrol pulseaudio # Audio.
		wl-clipboard # Clipboard.
	];

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

	environment = {
		variables = {
			FOOT_CONFIG = ./foot/Foot.ini;
			SWAY_CONFIG = ./sway/module;
			PATH        = [ "/etc/swaybin" ];
		};
		etc.swaybin.source = ./sway/bin;
	};
}
