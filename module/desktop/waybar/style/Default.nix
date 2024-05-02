{ style, ... }: {
	text = ''
		* {
			/* `otf-font-awesome` is required to be installed for icons */
			font-family: "${style.font.serif.name}", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
			font-size: ${toString(style.font.size.desktop)}px;
		}
	'';
}
