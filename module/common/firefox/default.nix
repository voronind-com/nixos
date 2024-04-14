{ util, ... }: {
	config = util.trimTabs ''
		// Bookmarks.
		lockPref("browser.microsummary.enabled",          true);
		lockPref("browser.places.importBookmarksHTML",    true);
		lockPref("browser.toolbars.bookmarks.visibility", "never");

		// Fonts.
		pref("browser.display.use_document_fonts", 0);
		lockPref("font.minimum-size.x-cyrillic", 12);
		lockPref("font.minimum-size.x-unicode",  12);
		lockPref("font.minimum-size.x-western",  12);
		lockPref("font.name.monospace.x-cyrillic", "Terminess Nerd Font Mono");
		lockPref("font.name.monospace.x-unicode",  "Terminess Nerd Font Mono");
		lockPref("font.name.monospace.x-western",  "Terminess Nerd Font Mono");
		lockPref("font.name.sans-serif.x-cyrillic", "SF Pro Text");
		lockPref("font.name.sans-serif.x-unicode",  "SF Pro Text");
		lockPref("font.name.sans-serif.x-western",  "SF Pro Text");
		lockPref("font.name.serif.x-cyrillic", "SF Pro Text");
		lockPref("font.name.serif.x-unicode",  "SF Pro Text");
		lockPref("font.name.serif.x-western",  "SF Pro Text");

		// Animations.
		lockPref("browser.fullscreen.animateUp", 0);
		lockPref("browser.fullscreen.autohide", true);

		// Homepage.
		lockPref("browser.newtabpage.enabled", false);
		lockPref("browser.startup.homepage", "https://home.voronind.com/");
		lockPref("browser.startup.page", 3);

		// Passwords.
		lockPref("signon.prefillForms",    false);
		lockPref("signon.rememberSignons", false);

		// Formats.
		lockPref("image.jxl.enabled", true);
	'';
}
