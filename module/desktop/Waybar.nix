{ pkgs, ... } @args: let
	waybar = import ./waybar args;
in {
	programs.waybar.enable = true;
	environment.variables.WAYBAR_CONFIG = pkgs.writeText "waybarConfig" waybar.config;
	environment.variables.WAYBAR_STYLE  = pkgs.writeText "waybarStyle"  waybar.style;
}
