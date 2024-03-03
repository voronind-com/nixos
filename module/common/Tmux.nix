{ ... }: {
	imports = [
		./tmux/Buffer.nix
		./tmux/Environment.nix
		./tmux/Pane.nix
		./tmux/Session.nix
		./tmux/Statusbar.nix
		./tmux/Window.nix
	];

	programs.tmux = {
		enable = true;
		extraConfig = ''
			# Remap <C-b> to <C-t>.
			unbind-key C-b
			set-option -g prefix C-t
			bind-key C-t send-prefix

			# Disable escape delay.
			set -sg escape-time 0

			# Reload config.
			bind -n M-r source-file /etc/tmux.conf
		'';
	};
}
