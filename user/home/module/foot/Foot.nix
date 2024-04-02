{ config, ... }: {
	config = ''
		font=${config.stylix.fonts.monospace.name}:size=${toString(config.stylix.fonts.sizes.terminal)}
		font-italic=${config.stylix.fonts.monospace.name}:size=${toString(config.stylix.fonts.sizes.terminal)}
		# font-bold=${config.stylix.fonts.monospace.name}:size=${toString(config.stylix.fonts.sizes.terminal)}
		font-bold-italic=${config.stylix.fonts.monospace.name}:size=${toString(config.stylix.fonts.sizes.terminal)}
		dpi-aware=yes

		[colors]
		alpha=${toString(config.stylix.opacity.terminal)}
		background=${config.lib.stylix.colors.base00}
		foreground=${config.lib.stylix.colors.base05}
	'';
}
