{ ... }: let
	mod = "M";
in {
	text = ''
		unbind-key C-b
		bind -n ${mod}-r source-file ~/.config/tmux/tmux.conf
	'';
}
