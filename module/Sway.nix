{ pkgs, lib, wallpaper, style, ... }: let
	sway = import ./sway/Config.nix { pkgs = pkgs; wallpaper = wallpaper; style = style; };
in {
	imports = [
		./desktop/App.nix
		./desktop/Bluetooth.nix
		./desktop/Brightness.nix
		./desktop/Dconf.nix
		./desktop/Portal.nix
		./desktop/Realtime.nix
		./desktop/Sound.nix
	];

	services.gnome.gnome-keyring.enable = lib.mkForce false;
	environment.systemPackages = with pkgs; [
		grim slurp # Screenshot.
		mako # Notification system.
		networkmanagerapplet # Internet configuration.
		pamixer pavucontrol pulseaudio # Audio.
		sway-contrib.inactive-windows-transparency
		wl-clipboard # Clipboard.
	];

	programs.sway = {
		enable = true;
		wrapperFeatures = {
			base = true;
			gtk  = true;
		};
		extraOptions = [
			"--config=${sway.config}"
		];
	};

	environment = {
		variables = {
			SWAY_CONFIG   = ./sway/module;
			SWAY_IWT_PATH = "${pkgs.sway-contrib.inactive-windows-transparency}/bin/inactive-windows-transparency.py";
			# PATH        = [ "/etc/swaybin" ]; # NOTE: Kept as an example on PATH modification.
		};
	};
}
