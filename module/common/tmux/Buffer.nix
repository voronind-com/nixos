{ ... }: {
	programs.tmux.extraConfig = ''
		# Scroll.
		bind -n M-p copy-mode -u
		bind -n M-n send-keys Pagedown

		# Copy mode.
		setw -g mode-keys vi
		bind -n M-v copy-mode
		bind -n M-P choose-buffer
		bind -T copy-mode-vi v send      -X begin-selection
		bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"

		# Selection style.
		set -g mode-style 'fg=black,bg=yellow bold'
	'';
}
