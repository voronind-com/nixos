{ style, ... }: {
	text = ''
		#workspaces button {
			padding: 0 4px;
			border-top: ${toString(style.window.border)}px solid transparent;
		}

		#workspaces button.focused {
			border-top: ${toString(style.window.border)}px solid #${style.color.accent};
		}
	'';
}
