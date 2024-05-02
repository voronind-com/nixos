{ style, ... }: {
	text = ''
		#workspaces button {
			padding: 0 5px;
			color: #${style.color.fg.light};
			background-color: transparent;
		}

		#workspaces button.focused {
			background-color: rgba(${style.color.bg-r},${style.color.bg-g},${style.color.bg-b},${toString(style.opacity.desktop)});
			border-top: 2px solid #${style.color.accent};
		}
	'';
}
