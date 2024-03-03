{ ... }: {
	programs.tmux.extraConfig = ''
		# Detach.
		bind -n M-z detach-client
		bind -n M-Z detach-client -a

		# Switch sessions.
		bind -n M-9 switch-client -p
		bind -n M-0 switch-client -n
		bind -n M-g choose-session

		# Resize to smallest client.
		set -g window-size smallest
	'';
}
