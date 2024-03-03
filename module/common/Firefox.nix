{ pkgs, environment, ... }: {
	# Disable profile switching on rebuild.
	environment.variables.MOZ_LEGACY_PROFILES = "1";
	programs.firefox = {
		enable  = true;
		package = pkgs.firefox-esr;
		languagePacks = [ "en-US" "ru" ];
		autoConfig = ''
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
		policies = {
			ManagedBookmarks = [
				{
					toplevel_name = "Pin";
				} {
					url  = "https://home.voronind.com";
					name = "Dashboard";
				} {
					url  = "https://music.yandex.ru";
					name = "Music";
				} {
					url  = "https://web.telegram.org";
					name = "Telegram";
				} {
					url  = "https://discord.com";
					name = "Discord";
				} {
					url  = "https://mail.fsight.ru";
					name = "Work Mail";
				} {
					url  = "https://git.voronind.com";
					name = "Git";
				} {
					url  = "https://git.fmp.fsight.world";
					name = "Work Git";
				} {
					url  = "https://support.fsight.ru";
					name = "Work Board";
				} {
					url  = "https://iot.voronind.com";
					name = "Hass";
				} {
					url  = "https://cloud.voronind.com";
					name = "Cloud";
				}
			];
			ExtensionUpdate = true;
			ExtensionSettings = {
				"*" = {
					install_sources   = [ "*" ];
					installation_mode = "blocked";
				};
				# "queryamoid@kaply.com" = {
				# 	installation_mode = "force_installed";
				# 	install_url       = "https://github.com/mkaply/queryamoid/releases/download/v0.1/query_amo_addon_id-0.1-fx.xpi";
				# };
				"{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
					installation_mode = "force_installed";
					install_url       = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
				};
				"cliget@zaidabdulla.com" = {
					installation_mode = "force_installed";
					install_url       = "https://addons.mozilla.org/firefox/downloads/latest/cliget/latest.xpi";
				};
				"addon@darkreader.org" = {
					installation_mode = "force_installed";
					install_url       = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
				};
				"{e7625f06-e252-479d-ac7a-db68aeaff2cb}" = {
					installation_mode = "force_installed";
					install_url       = "https://addons.mozilla.org/firefox/downloads/latest/togglefonts/latest.xpi";
				};
				"uBlock0@raymondhill.net" = {
					installation_mode = "force_installed";
					install_url       = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
				};
				"{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
					installation_mode = "force_installed";
					install_url       = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
				};
				"{08d5243b-4236-4a27-984b-1ded22ce01c3}" = {
					installation_mode = "force_installed";
					install_url       = "https://addons.mozilla.org/firefox/downloads/latest/gruvboxgruvboxgruvboxgruvboxgr/latest.xpi";
				};
			};
			SearchEngines = {
				Default = "Whoogle";
				Add = [
					{
						Alias              = "w";
						Description        = "Google search proxy.";
						IconURL            = "https://google.voronind.com/favicon.ico";
						Method             = "POST";
						Name               = "Whoogle";
						PostData           = "q={searchTerms}";
						SuggestURLTemplate = "https://google.voronind.com/autocomplete?q={searchTerms}";
						URLTemplate        = "https://google.voronind.com/search?q=%{searchTerms}";
					}
				];
			};
		};
	};
}
