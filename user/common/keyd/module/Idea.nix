{ setting, ... }: {
	text = ''
		[jetbrains-idea-ce]
		alt.a = C-A-5
		alt.c = C-S-A-t
		alt.d = S-f9
		alt.e = A-right
		alt.f = C-S-f
		alt.g = macro(gd)
		alt.o = C-o
		alt.q = A-left
		alt.r = S-f10
		alt.s = C-A-s
		alt.v = C-q
		alt.x = C-f4
		alt.z = C-f2
		alt./ = macro(C-/ up)
		alt.tab = timeout(f8, ${toString(setting.keyd.timeout.ms)}, macro2(0, 0, f7))
	'';
}
