{ lib, ... }: {
	text = lib.generators.toINI {} {
		"firefox" = {
			"alt.E" = "C-S-pagedown";
			"alt.N" = "S-f3";
			"alt.Q" = "C-S-pageup";
			"alt.a" = "A-left";
			"alt.capslock" = "C-t";
			"alt.d" = "A-right";
			"alt.e" = "C-pagedown";
			"alt.f" = "C-f";
			"alt.l" = "A-S-a";
			"alt.n" = "f3";
			"alt.p" = "C-S-l";
			"alt.q" = "C-pageup";
			"alt.r" = "C-f5";
			"alt.s" = "down";
			"alt.space" = "f6";
			"alt.u" = "C-S-t";
			"alt.w" = "up";
			"alt.x" = "C-w";
		};
	};
}
