{ style, setting, pkgs, ... }: let
	dpiaware = if setting.foot.font.dpi then "yes" else "no";
in {
	file = (pkgs.formats.iniWithGlobalSection {}).generate "FootConfig" {
		globalSection = {
			font                 = "${style.font.monospace.name}:size=${toString style.font.size.terminal}";
			# font-bold            = "${style.font.monospace.name}:size=${toString style.font.size.terminal}";
			font-italic          = "${style.font.monospace.name}:size=${toString style.font.size.terminal}";
			font-bold-italic     = "${style.font.monospace.name}:size=${toString style.font.size.terminal}";
			dpi-aware            = dpiaware;
			font-size-adjustment = setting.foot.font.step;
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
