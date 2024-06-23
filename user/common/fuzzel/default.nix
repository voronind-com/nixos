{ pkgs, style, setting, ... }: let
	dpiAware = if setting.dpiAware then "yes" else "no";
in {
	file = (pkgs.formats.ini {}).generate "FuzzelConfig" {
		main = {
			dpi-aware    = dpiAware;
			font         = "${style.font.serif.name}:size=${toString style.font.size.popup}";
			lines        = 20;
			# prompt       = "\"$ \"";
			show-actions = "yes";
			terminal     = setting.terminal.bin;
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
			background      = style.color.bg.dark    + style.opacity.hex;
			border          = style.color.border     + style.opacity.hex;
			match           = style.color.fg.light   + defaultOpacity;
			selection       = style.color.bg.regular + defaultOpacity;
			selection-match = style.color.accent     + defaultOpacity;
			selection-text  = style.color.fg.light   + defaultOpacity;
			text            = style.color.fg.light   + defaultOpacity;
		};
	};
}
