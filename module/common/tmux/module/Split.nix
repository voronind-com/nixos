{ key, setting, style, ... }: let
	mod = key.tmux.mod;

	accent = style.color.accent;
	bg     = style.color.bg.dark;
	fg     = style.color.fg.light;
in {
	text = ''
		bind -n ${mod}-${key.action.split.vertical}   split-window  -h -c "#{pane_current_path}"
		bind -n ${mod}-${key.action.split.horizontal} split-window  -v -c "#{pane_current_path}"
		bind -n ${mod}-${key.action.resize.equalize}  select-layout tiled
		bind -n ${mod}-${key.action.resize.up}        resize-pane   -U ${toString(setting.tmux.resize.step.vertical)}
		bind -n ${mod}-${key.action.resize.down}      resize-pane   -D ${toString(setting.tmux.resize.step.vertical)}
		bind -n ${mod}-${key.action.resize.left}      resize-pane   -L ${toString(setting.tmux.resize.step.horizontal)}
		bind -n ${mod}-${key.action.resize.right}     resize-pane   -R ${toString(setting.tmux.resize.step.horizontal)}
		bind -n ${mod}-${key.navigation.move.left}    swap-pane     -U
		bind -n ${mod}-${key.navigation.move.right}   swap-pane     -D
		unbind '"'
		unbind %

		bind -n ${mod}-${key.navigation.go.left}  select-pane -L
		bind -n ${mod}-${key.navigation.go.right} select-pane -R
		bind -n ${mod}-${key.navigation.go.up}    select-pane -U
		bind -n ${mod}-${key.navigation.go.down}  select-pane -D

		bind -n ${mod}-${key.action.hide} kill-pane
		bind -n ${mod}-${key.action.seek} kill-pane -a

		set -g pane-border-style        "fg=#${bg}"
		set -g pane-active-border-style "fg=#${accent}"
	'';
}
