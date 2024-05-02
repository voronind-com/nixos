{ style, ... }: {
	text = ''
		window#waybar {
			background-color: rgba(${style.color.bg-r},${style.color.bg-g},${style.color.bg-b},${toString(style.opacity.desktop)});
			color: #${style.color.fg.light}
		}
	'';
}
