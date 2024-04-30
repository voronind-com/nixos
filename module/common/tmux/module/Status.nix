{ style, key, setting, ... }: let
	mod = key.tmux.mod;

	accent = style.color.accent;
	bg     = style.color.bg.dark;
	fg     = style.color.fg.light;
in {
	text = ''
		bind-key -n ${mod}-${key.tmux.status.toggle} set-option -g status;
		bind-key -n ${mod}-${key.tmux.status.uber} run-shell 'tmux_script togglestatusbar'
		set -g status-interval ${toString(setting.tmux.status.interval)}
		set -g status-position bottom
		set -g status-justify  left
		set -g status-style "fg=#${fg}"

		set -g status-left "#[bold] #H-#S #(tmux_script client_count #S)"
		set -g status-left-length  ${toString(setting.tmux.status.length)}
		set -g status-right-length ${toString(setting.tmux.status.length)}
		set -g status-right "#(tmux_script statusbar) %d %a #[bold] %H:%M "

		set-window-option -g window-status-separator ""

		setw -g window-status-current-style  "fg=#${accent} bold"
		setw -g window-status-current-format " #W "

		setw -g window-status-style  ""
		setw -g window-status-format " #W "

		set-window-option -g visual-bell off
		setw -g window-status-bell-style "bold blink"
	'';
}
