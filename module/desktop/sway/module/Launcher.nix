{ config, ... }: let
	fontName = config.module.style.font.serif.name;
	fontSize = toString config.module.style.font.size.desktop;

	accent = config.module.style.color.accent;
	bg     = config.module.style.color.bg.dark;
	fg     = config.module.style.color.fg.light;
in {
	text = ''
		# Application launcher.
		# Note: pass the final command to swaymsg so that the resulting window can be opened
		# on the original workspace that the command was run on.
		# set $menu _dmenu_path_wrapped | wmenu -b -p 'Run:' -i -f "${fontName} ${fontSize}" -M ${bg}D9 -S ${bg}D9 -N ${bg}D9 -m ${accent} -s ${accent} -n ${fg} | xargs swaymsg exec --
		set $menu fuzzel

		bindsym $mod+space exec $menu
	'';
}
