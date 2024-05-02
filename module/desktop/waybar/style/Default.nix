{ style, ... }: {
	text = ''
		* {
			/* `otf-font-awesome` is required to be installed for icons */
			font-family: "${style.font.serif.name}", FontAwesome;
			font-size: ${toString(style.font.size.desktop)}px;
		}
	'';
}
