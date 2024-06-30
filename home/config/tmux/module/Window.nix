{ ... }: let
	mod = "M";
in {
	text = ''
		bind -n ${mod}-Escape new-window -c "#{pane_current_path}"
		bind -n ${mod}-t      new-window -c "#{pane_current_path}"

		bind -n ${mod}-x kill-window
		bind -n ${mod}-X kill-window -a

		bind -n ${mod}-e next-window
		bind -n ${mod}-q previous-window

		bind -n ${mod}-E swap-window -t +1\; select-window -t +1
		bind -n ${mod}-Q swap-window -t -1\; select-window -t -1
	'';
}
