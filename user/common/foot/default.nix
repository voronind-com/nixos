{ config, pkgs, ... }: let
	dpiAware = if config.setting.dpiAware then "yes" else "no";
	fontStep = 1;
in {
	file = (pkgs.formats.iniWithGlobalSection {}).generate "FootConfig" {
		globalSection = {
			font                 = "${config.module.style.font.monospace.name}:size=${toString config.module.style.font.size.terminal}";
			# font-bold            = "${style.font.monospace.name}:size=${toString style.font.size.terminal}";
			font-italic          = "${config.module.style.font.monospace.name}:size=${toString config.module.style.font.size.terminal}";
			font-bold-italic     = "${config.module.style.font.monospace.name}:size=${toString config.module.style.font.size.terminal}";
			dpi-aware            = dpiAware;
			font-size-adjustment = fontStep;
		};

		sections = {
			colors = {
				alpha      = config.module.style.opacity.terminal;
				background = config.module.style.color.bg.dark;
				foreground = config.module.style.color.fg.light;
			};
		};
	};
}
