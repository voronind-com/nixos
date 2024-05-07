{ wallpaper, style, ... }: let
	alpha  = style.opacity.inactive.hex;
	accent = style.color.accent  + alpha;
	bg     = style.color.bg.dark + alpha;
	border = style.color.border  + alpha;
	fg     = style.color.fg.light;
in {
	text = ''
		output * bg ${wallpaper.path} fill
		client.focused          "#${accent}" "#${bg}" "#${fg}" "#${accent}" "#${accent}"
		client.focused_inactive "#${border}" "#${bg}" "#${fg}" "#${border}" "#${border}"
		client.unfocused        "#${border}" "#${bg}" "#${fg}" "#${border}" "#${border}"
		client.urgent           "#${border}" "#${bg}" "#${fg}" "#${border}" "#${border}"
		client.placeholder      "#${bg}"     "#${bg}" "#${fg}" "#${bg}"     "#${bg}"
	'';
}
