{ key, style, ... }: {
	text = ''
		# Toggle tiling.
		bindsym $mod+${key.sway.window.floating.toggle} floating toggle

		# Swap focus between the tiling area and the floating area
		bindsym $mod+${key.sway.window.floating.cycle} focus mode_toggle

		# Move focus to the parent container
		# bindsym $mod+a focus parent

		# Split directions.
		bindsym $mod+${key.sway.window.split.horizontal} splith
		bindsym $mod+${key.sway.window.split.vertical}     splitv

		# Switch the current container between different layout styles.
		bindsym $mod+${key.sway.window.layout.toggle} layout toggle split tabbed

		# Fullscreen.
		bindsym $mod+${key.sway.window.fullscreen} fullscreen

		# Dim inactive windows.
		exec $SWAY_IWT_PATH --opacity ${toString(style.opacity.inactive.int)}

		# Drag floating windows by holding down $mod and left mouse button.
		# Resize them with right mouse button + $mod.
		# Despite the name, also works for non-floating windows.
		# Change normal to inverse to use left mouse button for resizing and right
		# mouse button for dragging.
		floating_modifier $mod normal

		# Kill focused window.
		bindsym $mod+${key.action.close} kill

		# Add gaps.
		gaps inner ${toString(style.window.gap)}

		# Launch everything tiled.
		# for_window [all] floating disable
	'';
}
