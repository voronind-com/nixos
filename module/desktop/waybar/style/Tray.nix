{ ... }: {
	text = ''
		#tray > .passive {
			-gtk-icon-effect: dim;
		}

		#tray > .needs-attention {
			-gtk-icon-effect: highlight;
			background-color: #eb4d4b;
		}
	'';
}
