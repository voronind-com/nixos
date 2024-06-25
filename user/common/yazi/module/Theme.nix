{ pkgs, config, ... }: let
	border = {
		fg = "#${config.module.style.color.border}";
	};
in {
	file = (pkgs.formats.toml {}).generate "YaziThemeConfig" {
		manager = {
			cwd = {
				fg = "#${config.module.style.color.fg.light}";
				# bg = "#${style.color.bg.regular}";
			};
			hovered = {
				fg = "#${config.module.style.color.fg.light}";
				bg = "#${config.module.style.color.bg.regular}";
			};
			preview_hovered = {
				fg = "#${config.module.style.color.fg.light}";
				bg = "#${config.module.style.color.bg.regular}";
			};
			border_style = border;
			tab_active = {
				bg = "#${config.module.style.color.accent}";
			};
		};
		select     = { inherit border; };
		input      = { inherit border; };
		completion = { inherit border; };
		tasks      = { inherit border; };
	};
}
