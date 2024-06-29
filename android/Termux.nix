{ pkgs, config, util, ... }: {
	font = pkgs.runCommandNoCC "font" {} ''
		cp ${pkgs.nerdfonts.override { fonts = [ "Terminus" ]; }}/share/fonts/truetype/NerdFonts/TerminessNerdFontMono-Regular.ttf $out
	'';

	colors = util.trimTabs ''
		background=#${config.style.color.bg.dark}
		foreground=#${config.style.color.fg.light}
	'';

	initScript = util.trimTabs ''
		[[ -f ~/.termux/font.ttf ]] || {
			cp ~/.termux/_font.ttf ~/.termux/font.ttf
			cp ~/.termux/_colors.properties ~/.termux/colors.properties
			_warn "Termux config installed, please restart."
		};
	'';
}
