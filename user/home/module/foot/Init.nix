{ style, setting, util, ... }: let
	foreground = if setting.foot.font.forceWhite then ''
		foreground=ffffff
	'' else ''
		foreground=${style.color.fg.light}
	'';
in {
	config = util.trimTabs ''
		font=${style.font.monospace.name}:size=${toString(style.font.size.terminal)}
		# font-bold=${style.font.monospace.name}:size=${toString(style.font.size.terminal)}
		font-italic=${style.font.monospace.name}:size=${toString(style.font.size.terminal)}
		font-bold-italic=${style.font.monospace.name}:size=${toString(style.font.size.terminal)}
		dpi-aware=${setting.foot.font.dpi}
		font-size-adjustment=${setting.foot.font.step}

		[colors]
		alpha=${toString(style.opacity.terminal)}
		background=${style.color.bg.dark}
	'' + foreground;
}
