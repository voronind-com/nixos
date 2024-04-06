{ style, key, ... }: let
	fontName = style.font.serif.name;
	fontSize = toString(style.font.size.popup);

	accent = style.color.accent;
	bg     = style.color.bg.dark;
	fg     = style.color.fg.light;
in {
	text = ''
		# Application launcher.
		# Note: pass the final command to swaymsg so that the resulting window can be opened
		# on the original workspace that the command was run on.
		set $menu _dmenu_path_wrapped | wmenu -b -p 'Run:' -i -f "${fontName} ${fontSize}" -M ${bg} -S ${bg} -N ${bg} -m ${accent} -s ${accent} -n ${fg} | xargs swaymsg exec --

		bindsym $mod+${key.action.launch} exec $menu
	'';
}
