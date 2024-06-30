{ ... }: {
	text = ''
		bindsym $mod+r exec pkill -SIGUSR1 waybar
		exec waybar
		exec nm-applet
	'';
}
