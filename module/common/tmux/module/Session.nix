{ key, ... }: let
	mod = key.tmux.mod;
in {
	text = ''
		bind -n ${mod}-${key.action.wait} detach-client
		bind -n ${mod}-${key.action.exit} detach-client -a

		bind -n ${mod}-${key.tmux.session.prev}   switch-client -p
		bind -n ${mod}-${key.tmux.session.next}   switch-client -n
		bind -n ${mod}-${key.tmux.session.choose} choose-session

		set -g window-size smallest
	'';
}
