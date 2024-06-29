{ pkgs, config, ... }: let
	border = {
		fg = "#${config.style.color.border}";
	};
	borderLight = {
		fg = "#${config.style.color.accent}";
	};
in {
	file = (pkgs.formats.toml {}).generate "YaziThemeConfig" {
		manager = {
			cwd = {
				fg = "#${config.style.color.fg.light}";
				# bg = "#${style.color.bg.regular}";
			};
			hovered = {
				fg = "#${config.style.color.fg.light}";
				bg = "#${config.style.color.bg.regular}";
			};
			preview_hovered = {
				fg = "#${config.style.color.fg.light}";
				bg = "#${config.style.color.bg.regular}";
			};
			border_style = border;
			tab_active = {
				bg = "#${config.style.color.accent}";
			};
		};
		select     = { inherit borderLight; };
		input      = { inherit borderLight; };
		completion = { inherit borderLight; };
		tasks      = { inherit borderLight; };
	};
}
