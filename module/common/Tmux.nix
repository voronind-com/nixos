{ ... }: {
	programs.tmux = {
		enable = true;
		extraConfig = builtins.readFile ./tmux/tmux.conf;
	};
}
