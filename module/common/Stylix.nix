{ pkgs, config, wallpaper, ... }: {
	environment.etc.wallpaper.source = wallpaper.path;
	stylix = {
		image = wallpaper.path;
		autoEnable = true;
		polarity = "dark";
		# base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
		opacity = {
			applications = 1.0;
			terminal     = 0.85;
			popups       = 1.0;
			desktop      = 0.85;
		};
		cursor = {
			name    = "phinger-cursors";
			package = pkgs.phinger-cursors;
			size    = 24;
		};
		fonts = {
			sizes = {
				applications = 12;
				terminal     = 12;
				popups       = 12;
				desktop      = 14;
			};
			serif = {
				package = (pkgs.callPackage ./applefont {});
				name    = "SF Pro Display";
			};
			sansSerif = config.stylix.fonts.serif;
			monospace = {
				package = (pkgs.nerdfonts.override { fonts = [ "Terminus" ]; });
				name    = "Terminess Nerd Font Mono";
			};
			emoji = {
				package = pkgs.noto-fonts-emoji;
				name = "Noto Color Emoji";
			};
		};
	};
}
