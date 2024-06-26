{ pkgs, pkgsStable, pkgsMaster, config, lib, ... } @args: with lib; let
	cfg = config.module.desktop.app;

	mangohud = import ./mangohud args;
	firefox  = import ./firefox args;
in {
	options = {
		module.desktop.app.enable = mkEnableOption "Desktop Apps.";
	};

	config = mkIf cfg.enable { xdg.mime.defaultApplications = {
			# Use `file -i file.txt` to find file mime type.
			# Use `xdg-mime query default "text/plain"` to find default app.
			"application/pdf" = "org.gnome.Evince.desktop";
			"application/vnd.openxmlformats-officedocument.*" = "onlyoffice-desktopeditors.desktop";
			"audio/*" = "mpv.desktop";
			"image/*" = "org.gnome.Loupe.desktop";
			"text/*"  = "nvim.desktop";
			"video/*" = "mpv.desktop";
		};

		hardware.graphics = let
			packages = with pkgs; [
				dxvk
				gamescope
				pkgs.mangohud
				vkd3d
			];
		in {
			extraPackages   = packages;
			extraPackages32 = packages;
		};

		environment = {
			systemPackages = with pkgs; [
				anilibria-winmaclinux    # Anime!
				appimage-run             # Tool to run .AppImage files in NixOS.
				aseprite                 # Pixel Art draw app. WARNING: Always builds from source.
				blanket                  # Sounds generator.
				blender-hip              # Blender with HiP support.
				calibre                  # Book library manager.
				evince                   # Document viewer.
				foot                     # Terminal emulator.
				gimp                     # Image manipulation program.
				gnome.adwaita-icon-theme # GTK icons.
				gnome.gnome-calculator   # Calculator.
				gnome.gnome-font-viewer  # Font viewer.
				gnome.nautilus           # File manager.
				jellyfin-media-player    # Jellyfin client (self-hosted Netflix).
				loupe                    # Image viewer.
				obs-studio               # Streaming/recording app.
				onlyoffice-bin           # Office documents app suite.
				steam-run                # Run native apps in Steam environment, like Minecraft. For Windows games use Bottles.
				tor-browser              # Privacy browser.

				android-studio jetbrains.idea-community           # JetBrans IDEs.
				bottles dxvk gamescope pkgs.mangohud vkd3d wine64 # Gaming!
				(mpv.override {scripts = [mpvScripts.mpris];})    # Media player.
			];

			variables = {
				# MangoHud.
				MANGOHUD = "1";
				MANGOHUD_CONFIGFILE  = pkgs.writeText "MangoHudConfig" mangohud.config;
				MANGOHUD_PRESETSFILE = pkgs.writeText "MangoHudPreset" mangohud.presets;

				# Proton.
				WINEFSYNC = "1";

				# GTK apps compat.
				GTK_CSD = 0;

				# Terminal settings.
				TERM     = "xterm-256color";
				TERMINAL = config.setting.terminal.bin;

				# Disable Firefox profile switching on rebuild.
				MOZ_LEGACY_PROFILES = "1";
			};
		};

		# File manager file previews.
		services.gnome.sushi.enable = true;

		# File manager network features.
		services.gvfs.enable = true;

		# Special packages.
		programs.steam.enable = true;

		programs.firefox = let
			mkExtension = install_url: {
				inherit install_url;
				installation_mode = "force_installed";
			};

			mkBookmark = name: url: { inherit name url; };
		in {
			enable  = true;
			package = pkgs.firefox-esr;
			languagePacks = [ "en-US" "ru" ];
			autoConfig = firefox.config;
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
	};
}
