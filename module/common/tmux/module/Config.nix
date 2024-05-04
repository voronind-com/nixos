{ key, ... }: let
	mod = key.tmux.mod;
in {
	text = ''
		unbind-key C-b
		bind -n ${mod}-${key.tmux.reload} source-file /etc/tmux.conf
	'';
}
