{ key, ... }: let
	mod = key.tmux.mod;
in {
	text = ''
		bind -n ${mod}-${key.tmux.reload} source-file /etc/tmux.conf
	'';
}
