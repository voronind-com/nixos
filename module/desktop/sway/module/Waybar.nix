{ ... }: {
	text = ''
		bindsym $mod+r exec pkill -SIGUSR1 waybar
		exec waybar -c ''${WAYBAR_CONFIG} -s ''${WAYBAR_STYLE}
		exec nm-applet
	'';
}
