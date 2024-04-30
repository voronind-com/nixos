{ key, ... }: let
	mod = key.tmux.mod;
in {
	text = ''
		bind -n ${mod}-${key.tmux.scroll.up} copy-mode -u
		bind -n ${mod}-${key.tmux.scroll.down} send-keys Pagedown
	'';
}
