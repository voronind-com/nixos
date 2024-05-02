{ ... }: {
	text = ''
		button {
			/* Use box-shadow instead of border so the text isn't offset */
			box-shadow: inset 0 -3px transparent;
			/* Avoid rounded borders under each button name */
			border: none;
			border-radius: 0;
		}

		/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
		button:hover {
			background: inherit;
			box-shadow: inset 0 -3px #ffffff;
		}
	'';
}
