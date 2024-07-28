{ ... }: {
	text = ''
		# Fullscreen screenshot.
		bindsym --to-code $mod+shift+v exec grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | wl-copy -t image/png

		# Select screenshot.
		bindsym --to-code $mod+v exec grim -g "$(slurp -d)" - | wl-copy
	'';
}
