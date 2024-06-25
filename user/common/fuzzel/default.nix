{ pkgs, config, ... }: let
	dpiAware = if config.setting.dpiAware then "yes" else "no";
in {
	file = (pkgs.formats.ini {}).generate "FuzzelConfig" {
		main = {
			dpi-aware    = dpiAware;
			# font         = "${style.font.serif.name}:size=${toString style.font.size.popup}";
			font         = "Minecraftia:size=${toString config.module.style.font.size.popup}";
			lines        = 20;
			prompt       = "\"\"";
			show-actions = "yes";
			terminal     = config.setting.terminal.bin;
			width        = 40;
			# list-executables-in-path = "no";
		};
		border = {
			radius = 0;
			width  = 1;
		};
		colors = let
			defaultOpacity = "ff";
		in {
			background      = config.module.style.color.bg.dark    + config.module.style.opacity.hex;
			border          = config.module.style.color.border     + config.module.style.opacity.hex;
			match           = config.module.style.color.fg.light   + defaultOpacity;
			selection       = config.module.style.color.bg.regular + defaultOpacity;
			selection-match = config.module.style.color.accent     + defaultOpacity;
			selection-text  = config.module.style.color.fg.light   + defaultOpacity;
			text            = config.module.style.color.fg.light   + defaultOpacity;
		};
	};
}
