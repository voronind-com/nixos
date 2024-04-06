{ key, ... }: {
	text = ''
		# Show last notification.
		bindsym $mod+${key.sway.notification.restore} exec makoctl restore

		# Hide all notifications.
		bindsym $mod+${key.sway.notification.dismiss} exec makoctl dismiss --all
	'';
}
