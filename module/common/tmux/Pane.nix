{ ... }: {
	programs.tmux.extraConfig = ''
		# Remap split keys.
		bind -n M-\\ split-window -h -c "#{pane_current_path}"
		bind -n M--  split-window -v -c "#{pane_current_path}"
		bind -n M-= select-layout tiled
		bind -n M-W resize-pane -U 1
		bind -n M-S resize-pane -D 1
		bind -n M-A resize-pane -L 1
		bind -n M-D resize-pane -R 1
		unbind '"'
		unbind %

		# Swith panes with alt + hjkl.
		bind -n M-a select-pane -L
		bind -n M-d select-pane -R
		bind -n M-w select-pane -U
		bind -n M-s select-pane -D

		# Close pane.
		bind -n M-c kill-pane
		bind -n M-C kill-pane -a
	'';
}
