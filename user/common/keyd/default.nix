{ util, ... }: {
	config = util.trimTabs ''
		[firefox]
		alt.q = C-S-tab
		alt.e = C-tab
		alt.x = C-w
		alt.t = C-t
		alt.r = C-f5
		alt.u = C-S-t
		alt.f = C-f
		alt.n = f3
		alt.p = S-f3
		alt.w = up
		alt.a = left
		alt.s = down
		alt.d = right
		alt.space = f6

		[steam-app-548430]
		alt.w = macro(enter 10ms r enter)
		alt.a = macro(enter 10ms N o enter)
		alt.s = macro(enter 10ms W a i t enter)
		alt.d = macro(enter 10ms Y e s enter)
		alt.q = macro(enter 10ms S o r r y ! enter)
		alt.e = macro(enter 10ms T h a n k s ! enter)
		alt.g = macro(enter 10ms g g enter)
		alt.z = macro(enter 10ms < space L e f t enter)
		alt.x = macro(enter 10ms > space H e r e space < enter)
		alt.c = macro(enter 10ms > space R i g h t enter)
		alt.r = macro(enter 10ms N e e d space m o r e space a m m o enter)
		alt.t = macro(enter 10ms M a y space I space t a k e space e x t r a ? enter)
		alt.v = macro(enter 10ms A F K enter)
		alt.f = macro(enter 10ms I space n e e d space h e l p ! enter)
		alt.b = macro(enter 10ms I ' m space b a c k enter)
		alt.l = macro(enter 10ms L e a f space l o v e r enter)
		alt.j = macro(enter 10ms G o o d space j o b enter)
		alt.k = macro(enter 10ms O k a y enter)
		alt.3 = macro(enter 10ms < 3 enter)
	'';
}
