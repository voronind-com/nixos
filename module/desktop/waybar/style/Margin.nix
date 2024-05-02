{ ... }: {
	text = ''
		#window,
		#workspaces {
			margin: 0 4px;
		}

		/* If workspaces is the leftmost module, omit left margin */
		.modules-left > widget:first-child > #workspaces {
			margin-left: 0;
		}

		/* If workspaces is the rightmost module, omit right margin */
		.modules-right > widget:last-child > #workspaces {
			margin-right: 0;
		}
	'';
}
