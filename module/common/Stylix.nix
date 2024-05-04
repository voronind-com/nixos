{ pkgs, config, wallpaper, ... }: let
	# Sometimes stylix does not generate enough contrast for text.
	# This setting forces white text to ensure contrast on dark backgrounds.
	forceWhiteText = false;
in {
	# Add a permanent link for the wallpaper to /etc/wallpaper.
	environment.etc.wallpaper.source = wallpaper.path;

	stylix = {
		image = wallpaper.path;
		autoEnable = true;
		polarity = "dark";
		opacity = {
			applications = 0.85;
			terminal     = 0.85;
			popups       = 0.85;
			desktop      = 0.85;
		};
		cursor = {
			name    = "Adwaita";
			package = pkgs.gnome3.adwaita-icon-theme;
			size    = 14;
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
		override = if forceWhiteText then {
			base04 = "ffffff";
			base05 = "ffffff";
			base06 = "ffffff";
		} else {};
	};
}
