{ key, style, ... }: let
	mod = key.tmux.mod;

	fg        = style.color.bg.dark;
	selection = style.color.selection;
in {
	text = ''
		setw -g mode-keys vi
		bind -n ${mod}-${key.tmux.copy.select} copy-mode
		bind -n ${mod}-${key.tmux.copy.paste}  choose-buffer;
		bind -T copy-mode-vi ${key.tmux.copy.select} send      -X begin-selection
		bind -T copy-mode-vi ${key.tmux.copy.copy}   send-keys -X copy-pipe-and-cancel "pbcopy"

		set -g mode-style "fg=#${fg} bg=#${selection} bold"
	'';
}
