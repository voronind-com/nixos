{ style, util, setting, ... }: {
	config = util.trimTabs ''
		anchor=top-center
		default-timeout=${setting.popup.timeout.ms}
		font=${style.font.serif.name} ${toString(style.font.size.popup)}
		background-color=#${style.color.bg.dark}
		border-color=#${style.color.bg.regular}
		text-color=#${style.color.fg.light}
		height=120
		icons=0
		margin=32
		width=480
	'';
}
