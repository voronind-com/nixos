{ style, ... }: {
	text = ''
		#clock,
		#battery,
		#pulseaudio,
		#tray,
		#language {
			padding: 8px 12px;
		}

		#clock {
			font-weight: bold;
		}
	'';
}
