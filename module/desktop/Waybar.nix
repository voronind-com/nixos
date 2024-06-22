{ pkgs, ... } @args: let
	waybar = import ./waybar args;
in {
	programs.waybar.enable = true;

	environment.variables = {
		WAYBAR_CONFIG = waybar.config;
		WAYBAR_STYLE  =  waybar.style;
	};
}
