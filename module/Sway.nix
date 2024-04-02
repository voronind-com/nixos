{ pkgs, lib, color, ... }: let
	config = pkgs.writeText "sway_config" ''
		client.focused          #${color.accent} #${color.accent}   #${color.fg}   #${color.accent}   #${color.accent}
		client.focused_inactive #${color.bg_1}   #${color.bg_3}     #${color.fg}   #${color.bg_3}     #${color.bg_3}
		client.unfocused        #${color.bg_1}   #${color.bg_3}     #${color.fg_3} #${color.bg_3}     #${color.bg_3}
		client.urgent           #${color.bg_3}   #${color.negative} #${color.fg_1} #${color.negative} #${color.negative}
		client.placeholder      #${color.bg}     #${color.bg}       #${color.fg}   #${color.bg}       #${color.bg}
		${builtins.readFile ./sway/Config}
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
			FOOT_CONFIG   = (import ./foot/Init.nix { pkgs = pkgs; fontSize = 14; color = color; }).config;
			SWAY_CONFIG   = ./sway/module;
			SWAY_IWT_PATH = "${pkgs.sway-contrib.inactive-windows-transparency}/bin/inactive-windows-transparency.py";
			# PATH        = [ "/etc/swaybin" ]; # NOTE: Kept as an example on PATH modification.
		};
	};
}
