{ pkgs, style, setting, ... }: let
	dpiAware = if setting.dpiAware then "yes" else "no";
in {
	file = (pkgs.formats.ini {}).generate "FuzzelConfig" {
		main = {
			dpi-aware    = dpiAware;
			font         = "${style.font.serif.name}:size=${toString style.font.size.popup}";
			lines        = 20;
			prompt       = "\"$ \"";
			show-actions = "yes";
			terminal     = setting.terminal;
			width        = 40;
			# list-executables-in-path = "no";
		};
		border = {
			radius = 0;
			width  = 1;
		};
		colors = {
			background      = style.color.bg.dark  + style.opacity.hex;
			border          = style.color.border   + style.opacity.hex;
			match           = style.color.fg.light + style.opacity.hex;
			selection       = style.color.bg.light + style.opacity.hex;
			selection-match = style.color.fg.dark  + style.opacity.hex;
			selection-text  = style.color.fg.dark  + style.opacity.hex;
			text            = style.color.fg.light + style.opacity.hex;
		};
	};
}
