{ pkgs, config, ... }: {
	config.stylix = {
		enable     = true;
		image      = config.module.common.wallpaper.path;
		autoEnable = false;
		polarity   = "dark";
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
		fonts = let
			serif = {
				package = (pkgs.callPackage ./applefont {});
				name    = "SF Pro Display";
			};
		in {
			inherit serif;
			sizes = {
				applications = 12;
				terminal     = 14;
				popups       = 12;
				desktop      = 14;
			};
			sansSerif = serif;
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
