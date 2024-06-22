{ key, style, ... }: let
	lock = "swaylock -f -F -c 000000 -k --font \"${style.font.serif.name}\" --font-size ${toString style.font.size.desktop}";
in {
	text = ''
		bindsym $mod+${key.action.wait} exec '_twice 1 ${lock}'
		bindsym $mod+Shift+${key.action.exit} exec _twice 1 bash -c '${lock}; systemctl suspend -i'
	'';
}
