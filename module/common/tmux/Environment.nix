{ ... }: {
	programs.tmux.extraConfig = ''
		# Update environment from client.
		set-option -g update-environment "SSH_CLIENT SSH_TTY DOCKER_CONFIG DOCKER_HOST DISPLAY XAUTHORITY"
	'';
}
