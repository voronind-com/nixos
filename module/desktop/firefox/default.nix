{ pkgs, util, ... } @args: let
	config = import ./Config.nix args;

	mkExtension = url: {
		installation_mode = "force_installed";
		install_url       = url;
	};

	mkBookmark = name: url: { inherit name url; };
in {
	# Disable profile switching on rebuild.
	environment.variables.MOZ_LEGACY_PROFILES = "1";

	programs.firefox = {
		enable  = true;
		package = pkgs.firefox-esr;
		languagePacks = [ "en-US" "ru" ];
		autoConfig = config.text;
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
				"uBlock0@raymondhill.net"                = mkExtension "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
				"{446900e4-71c2-419f-a6a7-df9c091e268b}" = mkExtension "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
				"{d7742d87-e61d-4b78-b8a1-b469842139fa}" = mkExtension "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
				"{e7625f06-e252-479d-ac7a-db68aeaff2cb}" = mkExtension "https://addons.mozilla.org/firefox/downloads/latest/togglefonts/latest.xpi";
				"{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}" = mkExtension "https://addons.mozilla.org/firefox/downloads/latest/user-agent-string-switcher/latest.xpi";
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
	};
}
