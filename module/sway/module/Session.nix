{ key, style, ... }: {
	text = ''
		bindsym $mod+${key.action.wait} exec '_twice 1 swaylock -F -c 000000 -k --font "${style.font.serif.name}" --font-size ${toString(style.font.size.desktop)}'
		bindsym $mod+Shift+${key.action.exit} exec '_twice 1 systemctl poweroff -i'
	'';
}
