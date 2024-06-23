{ setting, ... }: {
	text = ''
		set $term ${setting.terminal.bin}

		bindsym $mod+Escape exec $term -e bash -c "tmux new-session -A -s $USER; bash"
	'';
}
