{ ... }: {
	systemd.user.targets.gui-session = {
		after         = [ "graphical-session-pre.target" ];
		bindsTo       = [ "graphical-session.target" ];
		description   = "GUI session.";
		documentation = [ "man:systemd.special(7)" ];
		wants         = [ "graphical-session-pre.target" ];
	};
}
