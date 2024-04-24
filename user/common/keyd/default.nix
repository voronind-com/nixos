{ util, ... }: {
	config = util.trimTabs ''
		[firefox]
		alt.q = macro(C-S-tab)
		alt.e = macro(C-tab)
	'';
}
