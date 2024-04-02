{ pkgs, config, wallpaper, ... }: {
	stylix = {
		image = wallpaper.path;
		autoEnable = true;
		polarity = "dark";
		# base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
		fonts = {
			sizes = {
				applications = 12;
				terminal     = 12;
				popups       = 12;
				desktop      = 12;
			};
			# serif = {
			# 	package = (pkgs.callPackage ./applefont {});
			# 	name    = "SF Pro Display Medium";
			# };
			# sansSerif = config.stylix.fonts.serif;
			monospace = {
				package = (pkgs.nerdfonts.override { fonts = [ "Terminus" ]; });
				name    = "Terminess Mono";
			};
			emoji = {
				package = pkgs.noto-fonts-emoji;
				name = "Noto Color Emoji";
			};
		};
		targets = {
			foot = {
				enable = true;
			};
		};
	};
}
