{ style, ... }: {
	config = ''
		font=${style.font.monospace.name}:size=${toString(style.font.size.terminal)}
		# font-bold=${style.font.monospace.name}:size=${toString(style.font.size.terminal)}
		font-italic=${style.font.monospace.name}:size=${toString(style.font.size.terminal)}
		font-bold-italic=${style.font.monospace.name}:size=${toString(style.font.size.terminal)}
		dpi-aware=yes

		[colors]
		alpha=${toString(style.opacity.terminal)}
		background=${style.color.bg_dark}
		foreground=${style.color.fg}
	'';
}
