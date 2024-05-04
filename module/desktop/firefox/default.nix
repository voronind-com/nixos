{ pkgs, util, ... } @args: let
	config = import ./Config.nix args;

	mkExtension = url: {
		installation_mode = "force_installed";
		install_url       = url;
	};

	mkBookmark = name: url: { inherit name; inherit url; };
in {
	# Disable profile switching on rebuild.
	environment.variables = {
		MOZ_LEGACY_PROFILES = "1";
		MOZ_ENABLE_WAYLAND  = "1";
	};

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
				(mkBookmark "Telegram"  "https://web.telegram.org")
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
				# "queryamoid@kaply.com"                   = mkExtension "https://github.com/mkaply/queryamoid/releases/download/v0.1/query_amo_addon_id-0.1-fx.xpi";
				# "{08d5243b-4236-4a27-984b-1ded22ce01c3}" = mkExtension "https://addons.mozilla.org/firefox/downloads/latest/gruvboxgruvboxgruvboxgruvboxgr/latest.xpi";
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