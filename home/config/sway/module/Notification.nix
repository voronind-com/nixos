{ ... }: {
	text = ''
		# Show last notification.
		bindsym $mod+n exec makoctl restore

		# Hide all notifications.
		bindsym $mod+shift+N exec makoctl dismiss --all
	'';
}
