{ style, ... }: {
	text = ''
		#pulseaudio,
		#mpris,
		#cpu,
		#battery,
		#custom-display,
		#language {
			padding: 8px 0 8px 24px;
		}

		#temperature,
		#memory,
		#custom-powersave,
		#custom-powerlimit {
			padding: 8px 0 8px 0;
		}

		#clock {
			font-weight: bold;
		}

		#tray {
			padding: 8px 12px 8px 24px;
		}

		#battery:hover,
		#clock:hover,
		#cpu:hover,
		#custom-display:hover,
		#custom-powerlimit:hover,
		#custom-powersave:hover,
		#language:hover,
		#memory:hover,
		#mpris:hover,
		#pulseaudio:hover,
		#temperature:hover,
		#tray:hover,
		#workspaces button:hover {
			background-color: #ff0000;
		}

		#pulseaudio.muted,
		#battery.critical,
		#custom-display.modified {
			border-top: ${toString(style.window.border)}px solid #${style.color.accent};
		}

		#workspaces button {
			padding: 0 4px;
			border-top: ${toString(style.window.border)}px solid transparent;
		}

		#workspaces button.focused {
			border-top: ${toString(style.window.border)}px solid #${style.color.accent};
		}
	'';

			# background-color: rgba(${style.color.border-r},${style.color.border-g},${style.color.border-b},${toString(style.opacity.desktop)});
}
