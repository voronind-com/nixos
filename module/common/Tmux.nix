{ pkgs, style, key, util, ... } @args: let
	tmux = import ./tmux args;
in {
	programs.tmux = {
		enable = true;
		extraConfig = tmux.config;
	};
}
