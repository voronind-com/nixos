{ pkgs, fontSize, color, ... }: {
	config = pkgs.writeText "foot_config" ''
		font=Terminess Nerd Font Mono:size=${toString(fontSize)}
		# font-bold=Terminess Nerd Font Mono:size=${toString(fontSize)}:weight=bold
		font-italic=Terminess Nerd Font Mono:size=${toString(fontSize)}
		font-bold-italic=Terminess Nerd Font Mono:weight=bold:size=${toString(fontSize)}
		dpi-aware=yes

		[colors]
		background=${color.bg}
		foreground=${color.fg}
	'';
}
