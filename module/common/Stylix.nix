{ pkgs, config, ... }: {
	# Add a permanent link for the wallpaper to /etc/wallpaper.
	environment.etc.wallpaper.source = config.module.common.wallpaper.path;

	stylix = {
		# NOTE: Enable this later...
		# enable = true;
		image = config.module.common.wallpaper.path;
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
				terminal     = 14;
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
		override = if config.module.common.wallpaper.forceContrastText then {
			base04 = "000000";
			base05 = "ffffff";
			base06 = "ffffff";
		} else {};
	};
}
