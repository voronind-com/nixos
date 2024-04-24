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

		[steam_app_548430]
		control.w = macro(enter 10ms r enter)
		control.a = macro(enter 10ms N o enter)
		control.s = macro(enter 10ms W a i t enter)
		control.d = macro(enter 10ms Y e s enter)
		control.q = macro(enter 10ms S o r r y ! enter)
		control.e = macro(enter 10ms T h a n k s ! enter)
		control.g = macro(enter 10ms g g enter)
		control.z = macro(enter 10ms < space L e f t enter)
		control.x = macro(enter 10ms > space H e r e space < enter)
		control.c = macro(enter 10ms > space R i g h t enter)
		control.r = macro(enter 10ms N e e d space m o r e space a m m o enter)
		control.t = macro(enter 10ms M a y space I space t a k e space e x t r a ? enter)
		control.f = macro(enter 10ms A F K enter)
		control.v = macro(enter 10ms I space n e e d space h e l p ! enter)
		control.b = macro(enter 10ms I ' m space b a c k enter)
	'';
}
