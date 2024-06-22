{ pkgs, style, setting, ... }: let
	dpiAware = if setting.dpiAware then "yes" else "no";
in {
	file = (pkgs.formats.ini {}).generate "FuzzelConfig" {
		main = {
			font      = "${style.font.serif.name}:size=${toString style.font.size.popup}";
			dpi-aware    = dpiAware;
			show-actions = "yes";
			terminal     = setting.terminal;
			list-executables-in-path = "no";
			lines = 20;
			width = 40;
			# prompt    = "\"$ \""
		};
		border = {
			radius = 0;
			width  = 1;
		};
	};
}
