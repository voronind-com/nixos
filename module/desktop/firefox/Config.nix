{ util, style, ... }: {
	text = util.trimTabs ''
		// Bookmarks.
		lockPref("browser.microsummary.enabled",          true);
		lockPref("browser.places.importBookmarksHTML",    true);
		lockPref("browser.toolbars.bookmarks.visibility", "never");

		// Fonts.
		pref("browser.display.use_document_fonts", 0);
		lockPref("font.minimum-size.x-cyrillic", ${toString style.font.size.application});
		lockPref("font.minimum-size.x-unicode",  ${toString style.font.size.application});
		lockPref("font.minimum-size.x-western",  ${toString style.font.size.application});
		lockPref("font.name.monospace.x-cyrillic", "${style.font.monospace.name}");
		lockPref("font.name.monospace.x-unicode",  "${style.font.monospace.name}");
		lockPref("font.name.monospace.x-western",  "${style.font.monospace.name}");
		lockPref("font.name.sans-serif.x-cyrillic", "${style.font.sansSerif.name}");
		lockPref("font.name.sans-serif.x-unicode",  "${style.font.sansSerif.name}");
		lockPref("font.name.sans-serif.x-western",  "${style.font.sansSerif.name}");
		lockPref("font.name.serif.x-cyrillic", "${style.font.serif.name}");
		lockPref("font.name.serif.x-unicode",  "${style.font.serif.name}");
		lockPref("font.name.serif.x-western",  "${style.font.serif.name}");

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

		// User agent.
		// pref("general.useragent.override", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36");
	'';
}
