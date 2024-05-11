{ key, ... }: {
	text = ''
		# Terminal emulator.
		set $term foot

		bindsym $mod+${key.sway.launch.terminal} exec $term -e bash -c "tmux new-session -A -s $USER; bash"
	'';
}
