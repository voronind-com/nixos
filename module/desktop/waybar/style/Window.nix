{ style, ... }: {
	text = ''
		window#waybar {
			background-color: rgba(${style.color.bg-r},${style.color.bg-g},${style.color.bg-b},${toString(style.opacity.desktop)});
			color: #${style.color.fg.light};
			border: ${toString(style.window.border)}px solid rgba(${style.color.border-r},${style.color.border-g},${style.color.border-b},${toString(style.opacity.desktop)});
		}

		.modules-left > widget:first-child > #workspaces {
			margin-left: ${toString(style.window.border)}px;
		}

		.modules-right > widget:last-child > #workspaces {
			margin-right: ${toString(style.window.border)}px;
		}
	'';
}
