{ ... }: {
	programs.tmux.extraConfig = ''
		# Create new window.
		bind -n M-Escape new-window -c "#{pane_current_path}"
		bind -n M-t      new-window -c "#{pane_current_path}" # NOTE: for compatibility reasons.

		# Close window.
		bind -n M-x kill-window
		bind -n M-X kill-window -a

		# Switch window.
		bind -n M-e next-window
		bind -n M-q previous-window

		# Move window.
		bind -n M-E swap-window -t +1\; select-window -t +1
		bind -n M-Q swap-window -t -1\; select-window -t -1
	'';
}
