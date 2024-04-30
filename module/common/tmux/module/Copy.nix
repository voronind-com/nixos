{ key, style, ... }: let
	mod = key.tmux.mod;

	accent = style.color.accent;
	bg     = style.color.bg.dark;
	fg     = style.color.fg.light;
in {
	text = ''
		setw -g mode-keys vi
		bind -n ${mod}-${key.tmux.copy.select} copy-mode
		bind -n ${mod}-${key.tmux.copy.paste}  choose-buffer;
		bind -T copy-mode-vi ${key.tmux.copy.select} send      -X begin-selection
		bind -T copy-mode-vi ${key.tmux.copy.copy}   send-keys -X copy-pipe-and-cancel "pbcopy"

		set -g mode-style "fg=#${bg} bg=#${accent} bold"
	'';
}
