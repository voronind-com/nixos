{ style, ... }: {
	text = ''
		* {
			font-family: "${style.font.serif.name}", "Terminess Nerd Font Propo";
			font-size: ${toString(style.font.size.desktop)}px;
			color: #${style.color.fg.light};
		}
	'';
}
