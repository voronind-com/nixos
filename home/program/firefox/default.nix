{ util, pkgs, config, ... }: let
	extraConfig = util.trimTabs ''
		// Bookmarks.
		user_pref("browser.microsummary.enabled",          true);
		user_pref("browser.places.importBookmarksHTML",    true);
		user_pref("browser.toolbars.bookmarks.visibility", "never");

		// Fonts.
		user_pref("browser.display.use_document_fonts", 0);
		user_pref("font.minimum-size.x-cyrillic", ${toString config.style.font.size.application});
		user_pref("font.minimum-size.x-unicode",  ${toString config.style.font.size.application});
		user_pref("font.minimum-size.x-western",  ${toString config.style.font.size.application});
		user_pref("font.name.monospace.x-cyrillic", "${config.style.font.monospace.name}");
		user_pref("font.name.monospace.x-unicode",  "${config.style.font.monospace.name}");
		user_pref("font.name.monospace.x-western",  "${config.style.font.monospace.name}");
		user_pref("font.name.sans-serif.x-cyrillic", "${config.style.font.sansSerif.name}");
		user_pref("font.name.sans-serif.x-unicode",  "${config.style.font.sansSerif.name}");
		user_pref("font.name.sans-serif.x-western",  "${config.style.font.sansSerif.name}");
		user_pref("font.name.serif.x-cyrillic", "${config.style.font.serif.name}");
		user_pref("font.name.serif.x-unicode",  "${config.style.font.serif.name}");
		user_pref("font.name.serif.x-western",  "${config.style.font.serif.name}");

		// Animations.
		user_pref("browser.fullscreen.animateUp", 0);
		user_pref("browser.fullscreen.autohide", true);

		// Homepage.
		user_pref("browser.newtabpage.enabled", false);
		user_pref("browser.startup.homepage", "https://home.voronind.com/");
		user_pref("browser.startup.page", 3);

		// Passwords.
		user_pref("signon.prefillForms",    false);
		user_pref("signon.rememberSignons", false);

		// Formats.
		user_pref("image.jxl.enabled", true);

		// User agent.
		// user_pref("general.useragent.override", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36");
		user_pref("network.http.http3.enable", false)
	'';

	mkExtension = install_url: {
		inherit install_url;
		installation_mode = "force_installed";
	};

	mkBookmark = name: url: { inherit name url; };
in {
	enable  = true;
	package = pkgs.firefox-esr;
	# languagePacks = [ "en-US" "ru" ];
	profiles.default = {
		inherit extraConfig;
	};
	policies = {
		ManagedBookmarks = [
			{ toplevel_name = "Pin"; }
			(mkBookmark "Dashboard" "https://home.voronind.com")
			(mkBookmark "Music"     "https://music.yandex.ru")
			(mkBookmark "Telegram"  "https://web.telegram.org/a")
			(mkBookmark "Discord"   "https://discord.com")
			(mkBookmark "WorkMail"  "https://mail.fsight.ru")
			(mkBookmark "Git"       "https://git.voronind.com")
			(mkBookmark "WorkGit"   "https://git.fmp.fsight.world")
			(mkBookmark "WorkBoard" "https://support.fsight.ru")
			(mkBookmark "Hass"      "https://iot.voronind.com")
			(mkBookmark "Cloud"     "https://cloud.voronind.com")
		];
		ExtensionUpdate = true;
		ExtensionSettings = {
			# Block extension installation outside of this config.
			"*" = {
				install_sources   = [ "*" ];
				installation_mode = "blocked";
			};
			"addon@darkreader.org"                   = mkExtension "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
			"cliget@zaidabdulla.com"                 = mkExtension "https://addons.mozilla.org/firefox/downloads/latest/cliget/latest.xpi";
			"foxyproxy@eric.h.jung"                  = mkExtension "https://addons.mozilla.org/firefox/downloads/latest/foxyproxy-standard/latest.xpi";
			"uBlock0@raymondhill.net"                = mkExtension "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
			"{446900e4-71c2-419f-a6a7-df9c091e268b}" = mkExtension "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
			"{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}" = mkExtension "https://addons.mozilla.org/firefox/downloads/latest/user-agent-string-switcher/latest.xpi";
			"{d7742d87-e61d-4b78-b8a1-b469842139fa}" = mkExtension "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
			"{e7625f06-e252-479d-ac7a-db68aeaff2cb}" = mkExtension "https://addons.mozilla.org/firefox/downloads/latest/togglefonts/latest.xpi";
			# NOTE: This extension is helpful to find the required parameters for this config.
			# Or find them yourself inside the `about:support`.
			# "queryamoid@kaply.com"                   = mkExtension "https://github.com/mkaply/queryamoid/releases/download/v0.1/query_amo_addon_id-0.1-fx.xpi";
		};
		# NOTE: `firefox-esr` edition is required to change default search engine.
		SearchEngines = {
			Default = "Searx";
			Add = [
				{
					Alias              = "s";
					Description        = "Searx Search";
					IconURL            = "https://search.voronind.com/favicon.ico";
					Method             = "POST";
					Name               = "Searx";
					PostData           = "q={searchTerms}";
					# SuggestURLTemplate = "https://search.voronind.com/autocomplete?q={searchTerms}";
					URLTemplate        = "https://search.voronind.com/search?q=%{searchTerms}";
				}
			];
		};
	};
}
