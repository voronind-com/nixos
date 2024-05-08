{ style, ... }: {
	text = ''
		#pulseaudio,
		#tray,
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
			padding-right: 12px;
		}
	'';
}
