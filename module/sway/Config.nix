{ pkgs, wallpaper, config, ... }: let
	accent   = config.lib.stylix.colors.base02;
	bg       = config.lib.stylix.colors.base00;
	bg_alt   = config.lib.stylix.colors.base01;
	fg       = config.lib.stylix.colors.base04;
	fg_alt   = config.lib.stylix.colors.base05;
	negative = config.lib.stylix.colors.base03;
in {
	config = pkgs.writeText "sway_config" ''
		# Read `man 5 sway` for a complete reference.

		output * bg ${wallpaper.path} fill
		client.focused          #${accent} #${accent}   #${fg}     #${accent}   #${accent}
		client.focused_inactive #${bg_alt} #${bg_alt}   #${fg}     #${bg_alt}   #${bg_alt}
		client.unfocused        #${bg_alt} #${bg_alt}   #${fg_alt} #${bg_alt}   #${bg_alt}
		client.urgent           #${bg_alt} #${negative} #${fg_alt} #${negative} #${negative}
		client.placeholder      #${bg}     #${bg}       #${fg}     #${bg}       #${bg}

		include /etc/sway/config.d/*
		include $SWAY_CONFIG/*
	'';
}

