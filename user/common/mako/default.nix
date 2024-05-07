{ style, util, setting, ... }: let
	alpha = style.opacity.hex;
in {
	config = util.trimTabs ''
		anchor=top-center
		default-timeout=${toString(setting.popup.timeout.ms)}
		font=${style.font.serif.name} ${toString(style.font.size.popup)}
		background-color=#${style.color.bg.dark}${alpha}
		border-color=#${style.color.bg.regular}${alpha}
		text-color=#${style.color.fg.light}
		height=120
		icons=0
		margin=32
		width=480
	'';
}
