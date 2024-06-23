{ ... }: {
	text = ''
		# Navigation keys.
		set $down  s
		set $left  a
		set $right d
		set $up    w

		# Move focus.
		bindsym $mod+$down  focus down
		bindsym $mod+$left  focus left
		bindsym $mod+$right focus right
		bindsym $mod+$up    focus up

		# Move the focused window.
		bindsym $mod+Shift+$down  move down
		bindsym $mod+Shift+$left  move left
		bindsym $mod+Shift+$right move right
		bindsym $mod+Shift+$up    move up

		# Focus mouse following.
		focus_follows_mouse yes
	'';
}
