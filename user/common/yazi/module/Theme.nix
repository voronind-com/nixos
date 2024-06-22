{ pkgs, setting, style, ... }: let
	border = {
		fg = "#${style.color.border}";
	};
in {
	file = (pkgs.formats.toml {}).generate "YaziThemeConfig" {
		manager = {
			cwd = {
				fg = "#${style.color.fg.light}";
				bg = "#${style.color.bg.dark}";
			};
			hovered = {
				fg = "#${style.color.fg.light}";
				bg = "#${style.color.bg.dark}";
			};
			preview_hovered = {
				fg = "#${style.color.fg.light}";
				bg = "#${style.color.bg.dark}";
			};
			border_style = border;
			tab_active = {
				bg = "#${style.color.accent}";
			};
		};
		select     = { inherit border; };
		input      = { inherit border; };
		completion = { inherit border; };
		tasks      = { inherit border; };
	};
}
