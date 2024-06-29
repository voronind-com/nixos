{ util, config, ... }: {
	config = util.trimTabs ''
		// Bookmarks.
		lockPref("browser.microsummary.enabled",          true);
		lockPref("browser.places.importBookmarksHTML",    true);
		lockPref("browser.toolbars.bookmarks.visibility", "never");

		// Fonts.
		pref("browser.display.use_document_fonts", 0);
		lockPref("font.minimum-size.x-cyrillic", ${toString config.style.font.size.application});
		lockPref("font.minimum-size.x-unicode",  ${toString config.style.font.size.application});
		lockPref("font.minimum-size.x-western",  ${toString config.style.font.size.application});
		lockPref("font.name.monospace.x-cyrillic", "${config.style.font.monospace.name}");
		lockPref("font.name.monospace.x-unicode",  "${config.style.font.monospace.name}");
		lockPref("font.name.monospace.x-western",  "${config.style.font.monospace.name}");
		lockPref("font.name.sans-serif.x-cyrillic", "${config.style.font.sansSerif.name}");
		lockPref("font.name.sans-serif.x-unicode",  "${config.style.font.sansSerif.name}");
		lockPref("font.name.sans-serif.x-western",  "${config.style.font.sansSerif.name}");
		lockPref("font.name.serif.x-cyrillic", "${config.style.font.serif.name}");
		lockPref("font.name.serif.x-unicode",  "${config.style.font.serif.name}");
		lockPref("font.name.serif.x-western",  "${config.style.font.serif.name}");

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
