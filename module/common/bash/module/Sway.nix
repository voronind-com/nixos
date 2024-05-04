{ ... }: {
	text = ''
		# Kill all windows in Sway scratchpad.
		function sway_scratchpad_kill() {
			for window in $(swaymsg -t get_tree | jq -r 'recurse(.nodes[]?) | select(.name == "__i3_scratch").floating_nodes[].id'); do
				swaymsg [ con_id="$window" ] kill
			done
		}
	'';
}
