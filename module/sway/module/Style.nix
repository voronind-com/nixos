{ wallpaper, style, ... }: let
	accent   = style.color.accent;
	bg       = style.color.bg.dark;
	bg_alt   = style.color.bg.regular;
	fg       = style.color.fg.light;
	fg_alt   = style.color.fg.regular;
	negative = style.color.negative;
in {
	text = ''
		output * bg ${wallpaper.path} fill
		client.focused          #${accent} #${accent}   #${fg}     #${accent}   #${accent}
		client.focused_inactive #${bg_alt} #${bg_alt}   #${fg}     #${bg_alt}   #${bg_alt}
		client.unfocused        #${bg_alt} #${bg_alt}   #${fg_alt} #${bg_alt}   #${bg_alt}
		client.urgent           #${bg_alt} #${negative} #${fg_alt} #${negative} #${negative}
		client.placeholder      #${bg}     #${bg}       #${fg}     #${bg}       #${bg}
	'';
}
