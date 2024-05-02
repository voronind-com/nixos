{ ... }: {
	text = ''
		/* Using steps() instead of linear as a timing function to limit cpu usage */
		#battery.critical:not(.charging) {
			background-color: #f53c3c;
			color: #ffffff;
			animation-name: blink;
			animation-duration: 0.5s;
			animation-timing-function: steps(12);
			animation-iteration-count: infinite;
			animation-direction: alternate;
		}

		#power-profiles-daemon {
			padding-right: 15px;
		}

		#power-profiles-daemon.performance {
			background-color: #f53c3c;
			color: #ffffff;
		}

		#power-profiles-daemon.balanced {
			background-color: #2980b9;
			color: #ffffff;
		}

		#power-profiles-daemon.power-saver {
			background-color: #2ecc71;
			color: #000000;
		}
	'';
}
