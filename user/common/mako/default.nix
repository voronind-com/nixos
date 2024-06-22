{ style, pkgs, setting, ... }: let
	alpha = style.opacity.hex;
in {
	file = (pkgs.formats.iniWithGlobalSection {}).generate "MakoConfig" {
		globalSection = {
			anchor           = "top-center";
			background-color = "#${style.color.bg.dark}${alpha}";
			border-color     = "#${style.color.bg.regular}${alpha}";
			default-timeout  = setting.popup.timeout.ms;
			font             = "${style.font.serif.name} ${toString style.font.size.popup}";
			height           = 120;
			icons            = 0;
			margin           = 32;
			text-color       = "#${style.color.fg.light}";
			width            = 480;
		};
	};
}
