{ pkgs, lib, config, ... } @args: with lib; let
	cfg = config.module.desktop.sway;

	sway       = import ./sway args;
	swayconfig = pkgs.writeText "SwayConfig" sway.config;
	swayscript = pkgs.writeShellScriptBin "swayscript" sway.script;
in {
	options = {
		module.desktop.sway = {
			enable = mkEnableOption "Use Sway WM.";
		};
	};

	config = mkIf cfg.enable {
		module.desktop = {
			app.enable        = true;
			bluetooth.enable  = true;
			brightness.enable = true;
			dconf.enable      = true;
			portal.enable     = true;
			realtime.enable   = true;
			sound.enable      = true;
			waybar.enable     = true;
			wayland.enable    = true;
		};

		services.gnome.gnome-keyring.enable = mkForce false;
		environment = {
			systemPackages = with pkgs; [
				fuzzel                         # Application launcher.
				grim slurp                     # Screenshot.
				mako                           # Notification system.
				networkmanagerapplet           # Internet configuration.
				pamixer pavucontrol pulseaudio # Audio.
				playerctl                      # Multimedia controls.
				swayscript                     # My custom Sway shell scripts.
			];

			variables.XDG_CURRENT_DESKTOP = "sway";
		};

		programs.sway = {
			enable = true;
			wrapperFeatures = {
				base = true;
				gtk  = true;
			};
			extraOptions = [
				"--config=${swayconfig}"
			];
		};
	};
}
