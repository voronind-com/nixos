{ pkgs, config, ... }: let
	alpha = config.module.style.opacity.hex;
in {
	file = (pkgs.formats.iniWithGlobalSection {}).generate "MakoConfig" {
		globalSection = {
			anchor           = "top-center";
			background-color = "#${config.module.style.color.bg.dark}${alpha}";
			border-color     = "#${config.module.style.color.border}${alpha}";
			default-timeout  = config.setting.timeout.popup;
			font             = "${config.module.style.font.serif.name} ${toString config.module.style.font.size.popup}";
			height           = 120;
			icons            = 0;
			margin           = 32;
			text-color       = "#${config.module.style.color.fg.light}";
			width            = 480;
		};
	};
}
