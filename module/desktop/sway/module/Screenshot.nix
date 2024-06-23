{ ... }: {
	text = ''
		# Fullscreen screenshot.
		bindsym $mod+shift+v exec grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | wl-copy -t image/png

		# Select screenshot.
		bindsym $mod+v exec grim -g "$(slurp -d)" - | wl-copy
	'';
}
