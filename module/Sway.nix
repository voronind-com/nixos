{ pkgs, lib, wallpaper, ... }: let
	config = pkgs.writeText "sway_config" ''
		${builtins.readFile ./sway/Config}
		output * bg ${wallpaper.path} fill
	'';
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
			"--config=${config}"
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
