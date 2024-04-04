{ pkgs, wallpaper, style, ... }: let
	accent   = style.color.accent;
	bg       = style.color.bg_dark;
	bg_alt   = style.color.bg;
	fg       = style.color.fg;
	fg_alt   = style.color.fg_dark;
	negative = style.color.negative;
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

