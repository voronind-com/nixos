{ key, style, ... }: {
	text = ''
		bindsym $mod+${key.action.wait} exec '_twice 1 swaylock -f -F -c 000000 -k --font "${style.font.serif.name}" --font-size ${toString(style.font.size.desktop)}'
		bindsym $mod+Shift+${key.action.exit} exec _twice 1 bash -c 'swaylock -f -F -c 000000 -k --font "${style.font.serif.name}" --font-size ${toString(style.font.size.desktop)}; systemctl suspend -i'
	'';
}
