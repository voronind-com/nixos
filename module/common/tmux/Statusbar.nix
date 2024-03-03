{ ... }: {
	programs.tmux.extraConfig = ''
		# Statusbar.
		set -g status-interval 2
		set -g status-position bottom
		set -g status-justify  left
		set -g status-style 'bg=color236 fg=color187'

		set -g status-left ' #[bold]#H-#S #(count=$(tmux list-clients -t #S | wc -l); [ $${count} -gt 1 ] && echo "($${count}) ")'
		set -g status-left-length 50
		set -g status-right ' #(head -c -1 /sys/class/power_supply/BAT*/capacity 2> /dev/null && echo -n "% ")#[fg=color187,bg=color239] %Y-%m-%d #[bg=color138,fg=black,bold] %H:%M '
		set -g status-right-length 50

		setw -g window-status-current-style  'fg=black bg=color143 bold'
		setw -g window-status-current-format ' #[fg=black]#W#[fg=black]#F '

		setw -g window-status-style  'fg=black bg=color138'
		setw -g window-status-format ' #[fg=black]#W#[fg=black] '

		setw -g window-status-bell-style 'fg=black bg=white bold'
	'';
}
