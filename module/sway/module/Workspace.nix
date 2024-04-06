{ key, ... }: {
	text = ''
		# Switch to workspace.
		bindsym $mod+1 workspace number 1
		bindsym $mod+2 workspace number 2
		bindsym $mod+3 workspace number 3
		bindsym $mod+4 workspace number 4
		bindsym $mod+5 workspace number 5
		bindsym $mod+6 workspace number 6
		bindsym $mod+7 workspace number 7
		bindsym $mod+8 workspace number 8
		bindsym $mod+9 workspace number 9
		bindsym $mod+0 workspace number 10

		# Move focused container to workspace.
		bindsym $mod+Shift+1 move container to workspace number 1
		bindsym $mod+Shift+2 move container to workspace number 2
		bindsym $mod+Shift+3 move container to workspace number 3
		bindsym $mod+Shift+4 move container to workspace number 4
		bindsym $mod+Shift+5 move container to workspace number 5
		bindsym $mod+Shift+6 move container to workspace number 6
		bindsym $mod+Shift+7 move container to workspace number 7
		bindsym $mod+Shift+8 move container to workspace number 8
		bindsym $mod+Shift+9 move container to workspace number 9
		bindsym $mod+Shift+0 move container to workspace number 10
		# Note: workspaces can have any name you want, not just numbers.
		# We just use 1-10 as the default.

		# Switch left-right.
		bindsym $mod+${key.navigation.go.next} workspace next
		bindsym $mod+${key.navigation.go.prev} workspace prev

		# Move left-right.
		bindsym $mod+Shift+${key.navigation.move.next} move container to workspace next
		bindsym $mod+Shift+${key.navigation.move.prev} move container to workspace prev
	'';
}
