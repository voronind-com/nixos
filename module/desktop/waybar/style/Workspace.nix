{ style, ... }: {
	text = ''
		#workspaces button {
			padding: 0 4px;
			border-top: 2px solid transparent;
		}

		#workspaces button.focused {
			border-top: 2px solid #${style.color.accent};
		}
	'';
}
