{ style, ... }: {
	text = ''
		#workspaces button {
			padding: 0 4px;
			color: #${style.color.fg.light};
			border-top: 2px solid transparent;
			background-color: transparent;
			background-color: rgba(${style.color.bg-r},${style.color.bg-g},${style.color.bg-b},${toString(style.opacity.desktop)});
		}

		#workspaces button.focused {
			border-top: 2px solid #${style.color.accent};
		}
	'';
}
