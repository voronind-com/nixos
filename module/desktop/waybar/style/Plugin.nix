{ style, ... }: {
	text = ''
		#clock,
		#battery,
		#cpu,
		#memory,
		#disk,
		#temperature,
		#backlight,
		#network,
		#pulseaudio,
		#wireplumber,
		#custom-media,
		#tray,
		#mode,
		#idle_inhibitor,
		#scratchpad,
		#mpd {
			margin: 2px;
			padding-left: 4px;
			padding-right: 4px;
		}

		#clock {
			font-weight: bold;
		}
	'';
}
