{ pkgs, lib, ... } @args: let
	sway   = import ./desktop/sway args;
	config = pkgs.writeText "swayConfig" sway.config;
	script = pkgs.writeShellScriptBin "swayscript" sway.script;
in {
	imports = [
		./desktop/App.nix
		./desktop/Bluetooth.nix
		./desktop/Brightness.nix
		./desktop/Dconf.nix
		./desktop/Portal.nix
		./desktop/Realtime.nix
		./desktop/Sound.nix
		./desktop/Waybar.nix
		./desktop/Wayland.nix
	];

	services.gnome.gnome-keyring.enable = lib.mkForce false;
	environment = {
		systemPackages = with pkgs; [
			fuzzel                         # Application launcher.
			grim slurp                     # Screenshot.
			mako                           # Notification system.
			networkmanagerapplet           # Internet configuration.
			pamixer pavucontrol pulseaudio # Audio.
			playerctl                      # Multimedia controls.
			script                         # My custom Sway shell scripts.
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
			"--config=${config}"
		];
	};
}
