{ key, ... }: let
	mod = key.tmux.mod;
in {
	text = ''
		bind -n ${mod}-${key.tmux.window.new}        new-window -c "#{pane_current_path}"
		bind -n ${mod}-${key.tmux.window.new_compat} new-window -c "#{pane_current_path}"

		bind -n ${mod}-${key.action.close} kill-window
		bind -n ${mod}-${key.action.kill}  kill-window -a

		bind -n ${mod}-${key.navigation.go.next} next-window
		bind -n ${mod}-${key.navigation.go.prev} previous-window

		bind -n ${mod}-${key.navigation.move.next} swap-window -t +1\; select-window -t +1
		bind -n ${mod}-${key.navigation.move.prev} swap-window -t -1\; select-window -t -1
	'';
}
