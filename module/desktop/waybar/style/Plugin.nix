{ style, ... }: {
	text = ''
		#clock,
		#battery,
		#pulseaudio,
		#tray,
		#mpris,
		#language {
			padding: 8px 12px;
		}

		#clock {
			font-weight: bold;
		}

		#cpu {
			padding: 8px 0 8px 12px;
		}

		#temperature {
			padding: 8px 0 8px 0;
		}

		#memory {
			padding: 8px 12px 8px 0;
		}
	'';
}
