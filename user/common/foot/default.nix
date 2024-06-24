{ style, config, pkgs, ... }: let
	dpiAware = if config.setting.dpiAware then "yes" else "no";
	fontStep = 1;
in {
	file = (pkgs.formats.iniWithGlobalSection {}).generate "FootConfig" {
		globalSection = {
			font                 = "${style.font.monospace.name}:size=${toString style.font.size.terminal}";
			# font-bold            = "${style.font.monospace.name}:size=${toString style.font.size.terminal}";
			font-italic          = "${style.font.monospace.name}:size=${toString style.font.size.terminal}";
			font-bold-italic     = "${style.font.monospace.name}:size=${toString style.font.size.terminal}";
			dpi-aware            = dpiAware;
			font-size-adjustment = fontStep;
		};

		sections = {
			colors = {
				alpha      = style.opacity.terminal;
				background = style.color.bg.dark;
				foreground = style.color.fg.light;
			};
		};
	};
}
