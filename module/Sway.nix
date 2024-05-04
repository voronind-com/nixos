{ pkgs, lib, wallpaper, style, ... } @args: let
	sway   = import ./sway args;
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
	environment.systemPackages = with pkgs; [
		grim slurp                     # Screenshot.
		mako                           # Notification system.
		networkmanagerapplet           # Internet configuration.
		pamixer pavucontrol pulseaudio # Audio.
		playerctl                      # Multimedia controls.
		script
	];

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
