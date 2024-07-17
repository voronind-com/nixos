{ ... }: {
	text = ''
		bindsym $mod+shift+r exec 'pkill -SIGUSR1 waybar || waybar'
		exec waybar
		exec nm-applet
	'';
}
