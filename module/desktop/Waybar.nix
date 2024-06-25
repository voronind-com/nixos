{ pkgs, lib, config, ... } @args: with lib; let
	cfg    = config.module.desktop.waybar;
	waybar = import ./waybar args;
in {
	options = {
		module.desktop.waybar.enable = mkEnableOption "Waybar.";
	};

	config = mkIf cfg.enable {
		programs.waybar.enable = true;

		environment.variables = {
			WAYBAR_CONFIG = waybar.config;
			WAYBAR_STYLE  = waybar.style;
		};
	};
}
