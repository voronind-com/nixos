{ key, ... }: {
	text = ''
		# Fullscreen screenshot.
		bindsym $mod+${key.sway.screenshot.screen} exec grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | wl-copy -t image/png

		# Select screenshot.
		bindsym $mod+${key.sway.screenshot.selection} exec grim -g "$(slurp -d)" - | wl-copy
	'';
}
