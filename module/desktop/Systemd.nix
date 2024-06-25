{ lib, config, ... }: with lib; let
	cfg = config.module.desktop.systemd;
in {
	options = {
		module.desktop.systemd.enable = mkEnableOption "Systemd Desktop config.";
	};

	config = mkIf cfg.enable {
		# Systemd custom target for Sway.
		systemd.user.targets.gui-session = {
			after         = [ "graphical-session-pre.target" ];
			bindsTo       = [ "graphical-session.target" ];
			description   = "GUI session.";
			documentation = [ "man:systemd.special(7)" ];
			wants         = [ "graphical-session-pre.target" ];
		};
	};
}
