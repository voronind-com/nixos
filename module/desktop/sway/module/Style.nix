{ config, ... }: let
	alpha  = config.module.style.opacity.hex;
	accent = config.module.style.color.accent  + alpha;
	bg     = config.module.style.color.bg.dark + alpha;
	border = config.module.style.color.border  + alpha;
	fg     = config.module.style.color.fg.light;
in {
	text = ''
		output * bg ${config.module.common.wallpaper.path} fill
		client.focused          "#${accent}" "#${bg}" "#${fg}" "#${accent}" "#${accent}"
		client.focused_inactive "#${border}" "#${bg}" "#${fg}" "#${border}" "#${border}"
		client.unfocused        "#${border}" "#${bg}" "#${fg}" "#${border}" "#${border}"
		client.urgent           "#${border}" "#${bg}" "#${fg}" "#${border}" "#${border}"
		client.placeholder      "#${bg}"     "#${bg}" "#${fg}" "#${bg}"     "#${bg}"
	'';
}
