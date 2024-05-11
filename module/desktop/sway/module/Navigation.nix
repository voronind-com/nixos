{ key, ... }: {
	text = ''
		# Navigation keys.
		set $down  ${key.navigation.go.down}
		set $left  ${key.navigation.go.left}
		set $right ${key.navigation.go.right}
		set $up    ${key.navigation.go.up}

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
