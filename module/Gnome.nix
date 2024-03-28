{ pkgs, lib, ... }: {
	# GUI.
	services.xserver.enable = true;
	services.xserver.displayManager.gdm.enable   = true;
	services.xserver.desktopManager.gnome.enable = true;
	services.xserver.xkb = {
		layout  = "us,ru";
		options = "grp:caps_toggle,lv3:ralt_switch";
	};

	# Specify default apps.
	xdg.mime.defaultApplications = {
		# Use `file -i file.txt` to find file mime type.
		# Use `xdg-mime query default "text/plain"` to find default app.
		"application/pdf" = "org.gnome.Evince.desktop";
		"application/vnd.openxmlformats-officedocument.*" = "onlyoffice-desktopeditors.desktop";
		"audio/*" = "mpv.desktop";
		"image/*" = "org.gnome.Loupe.desktop";
		"text/*"  = "nvim.desktop";
		"video/*" = "mpv.desktop";
	};

	# Extra apps.
	environment.systemPackages = with pkgs; [
		adwsteamgtk
		gnome.gnome-remote-desktop
		gnome.gnome-tweaks
		gradience
		openssl
		wl-clipboard
	];

	# Disable some apps.
	services.gnome.gnome-keyring.enable = lib.mkForce false;
	environment.gnome.excludePackages = with pkgs.gnome; [
		# baobab      # Disk usage analyzer.
		# cheese      # Photo booth.
		# epiphany    # Web browser.
		# simple-scan # Document scanner.
		# totem       # Video player.
		# yelp        # Help viewer.
		# file-roller # Archive manager.
		# geary       # Email client.
		# seahorse    # Password manager.

		# gnome-calculator
		# gnome-calendar
		# gnome-characters
		# gnome-clocks
		# gnome-contacts
		# gnome-font-viewer
		# gnome-keyring
		# gnome-logs
		# gnome-maps
		# gnome-music
		# gnome-shell-extensions
		gnome-software
		# gnome-system-monitor
		# gnome-weather
		# gnome-disk-utility
		# pkgs.gnome-text-editor
	];

	# Sound.
	sound.enable = true;
	hardware.pulseaudio.enable = false;
	security.rtkit.enable      = true;
	services.pipewire = {
		enable            = true;
		alsa.enable       = true;
		alsa.support32Bit = true;
		pulse.enable      = true;
	};

	# Enable dconf.
	programs.dconf.enable = true;
	programs.dconf.profiles.user = {
		enableUserDb = true; # Delete `~/.config/dconf/user` to reset user settings.
		databases = [{
			settings = with lib.gvariant; {
				"org/gnome/desktop/a11y" = {
					always-show-universal-access-status = true;
				};

				"org/gnome/desktop/background" = {
					color-shading-type = "solid";
					picture-options    = "none";
					primary-color      = "#000000000000";
					secondary-color    = "#000000000000";
				};

				"org/gnome/desktop/input-sources" = {
					current          = mkUint32 0;
					mru-sources      = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "ru" ]) ];
					per-window       = false;
					show-all-sources = true;
					sources          = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "ru" ]) ];
					xkb-options      = [ "grp:caps_toggle" "lv3:ralt_switch" ];
				};

				"org/gnome/desktop/interface" = {
					clock-show-date          = true;
					clock-show-weekday       = true;
					color-scheme             = "prefer-dark";
					cursor-blink             = false;
					cursor-size              = "24";
					cursor-theme             = "Adwaita";
					document-font-name       = "SF Pro Text 11";
					enable-animations        = false;
					enable-hot-corners       = false;
					font-antialiasing        = "rgba";
					font-hinting             = "full";
					font-name                = "SF Pro Display 10";
					gtk-enable-primary-paste = false;
					gtk-theme                = "Adwaita";
					icon-theme               = "Adwaita";
					monospace-font-name      = "Terminess Nerd Font Mono Medium 12";
					show-battery-percentage  = false;
					toolbar-style            = "text";
					toolkit-accessibility    = false;
				};

				"org/gnome/desktop/media-handling" = {
					automount      = false;
					automount-open = false;
					autorun-never  = true;
				};

				"org/gnome/desktop/peripherals/mouse" = {
					accel-profile  = "flat";
					natural-scroll = true;
					speed          = "0.0";
				};

				"org/gnome/desktop/peripherals/touchpad" = {
					tap-to-click = true;
					two-finger-scrolling-enabled = true;
				};

				"org/gnome/desktop/privacy" = {
					disable-camera            = false;
					disable-microphone        = false;
					old-files-age             = mkUint32 30;
					recent-files-max-age      = mkUint32 30;
					remove-old-temp-files     = true;
					remove-old-trash-files    = true;
					report-technical-problems = true;
				};

				"org/gnome/desktop/remote-desktop/rdp" = {
					enable    = false;
					tls-cert  = "/home/voronind/.local/share/gnome-remote-desktop/tls.crt";
					tls-key   = "/home/voronind/.local/share/gnome-remote-desktop/tls.key";
					view-only = true;
				};

				"org/gnome/desktop/screensaver" = {
					color-shading-type      = "solid";
					idle-activation-enabled = false;
					lock-delay              = mkUint32 0;
					picture-options         = "zoom";
					picture-uri             = "file:///etc/wallpaper/Forest.jpg";
					primary-color           = "#000000000000";
					secondary-color         = "#000000000000";
				};

				"org/gnome/desktop/sound" = {
					allow-volume-above-100-percent = false;
					event-sounds = false;
					theme-name   = "freedesktop";
				};

				"org/gnome/desktop/wm/keybindings" = {
					activate-window-menu         = [ "" ];
					begin-move                   = [ "" ];
					begin-resize                 = [ "<Super>r" ];
					close                        = [ "<Super>x" ];
					cycle-group                  = [ "" ];
					cycle-group-backward         = [ "" ];
					cycle-panels                 = [ "" ];
					cycle-panels-backward        = [ "" ];
					cycle-windows                = [ "" ];
					cycle-windows-backward       = [ "" ];
					maximize                     = [ "" ];
					maximize-horizontally        = [ "" ];
					minimize                     = [ "<Super>s" ];
					move-to-monitor-down         = [ "" ];
					move-to-monitor-left         = [ "" ];
					move-to-monitor-right        = [ "" ];
					move-to-monitor-up           = [ "" ];
					move-to-workspace-1          = [ "" ];
					move-to-workspace-2          = [ "" ];
					move-to-workspace-3          = [ "" ];
					move-to-workspace-4          = [ "" ];
					move-to-workspace-last       = [ "" ];
					move-to-workspace-left       = [ "<Shift><Super>q" ];
					move-to-workspace-right      = [ "<Shift><Super>e" ];
					panel-run-dialog             = [ "<Super>space" ];
					show-desktop                 = [ "<Super>c" ];
					switch-applications          = [ "<Super>Tab" ];
					switch-applications-backward = [ "<Shift><Super>Tab" ];
					switch-group                 = [ "<Alt>Tab" ];
					switch-group-backward        = [ "<Shift><Alt>Tab" ];
					switch-input-source          = [ "" ];
					switch-input-source-backward = [ "" ];
					switch-panels                = [ "" ];
					switch-panels-backward       = [ "" ];
					switch-to-workspace-1        = [ "" ];
					switch-to-workspace-2        = [ "" ];
					switch-to-workspace-3        = [ "" ];
					switch-to-workspace-4        = [ "" ];
					switch-to-workspace-last     = [ "" ];
					switch-to-workspace-left     = [ "<Super>q" ];
					switch-to-workspace-right    = [ "<Super>e" ];
					switch-windows               = [ "" ];
					switch-windows-backward      = [ "" ];
					toggle-fullscreen            = [ "<Super>f" ];
					toggle-maximized             = [ "<Super>w" ];
					unmaximize                   = [ "" ];
				};

				"org/gnome/desktop/wm/preferences" = {
					action-middle-click-titlebar = "minimize";
					action-right-click-titlebar  = "menu";
					focus-mode    = "click"; # `click` or `sloppy`.
					button-layout = "appmenu:close";
					titlebar-font = "SF Pro Display 11";
				};

				"org/gnome/desktop/session" = {
					idle-delay = mkUint32 0;
				};

				"org/gnome/mutter" = {
					attach-modal-dialogs       = true;
					center-new-windows         = true;
					dynamic-workspaces         = true;
					edge-tiling                = true;
					workspaces-only-on-primary = true;
				};

				"org/gnome/mutter/keybindings" = {
					toggle-tiled-left  = [ "<Super>a" ];
					toggle-tiled-right = [ "<Super>d" ];
				};

				"org/gnome/mutter/wayland/keybindings" = {
					restore-shortcuts = [ "" ];
				};

				"org/gnome/nautilus/icon-view" = {
					default-zoom-level = "larger";
				};

				"org/gnome/nautilus/list-view" = {
					default-zoom-level = "small";
					use-tree-view      = false;
				};

				"org/gnome/nautilus/preferences" = {
					click-policy                  = "single";
					default-folder-viewer         = "list-view";
					default-sort-in-reverse-order = false;
					default-sort-order            = "name";
					migrated-gtk-settings         = true;
					search-filter-time-type       = "last_modified";
					search-view                   = "list-view";
					show-image-thumbnails         = "local-only";
				};

				"org/gnome/settings-daemon/plugins/color" = {
					night-light-enabled            = false;
					night-light-schedule-automatic = false;
					night-light-schedule-from      = "0.0";
					night-light-schedule-to        = "0.0";
					night-light-temperature        = mkUint32 3700;
				};

				"org/gnome/settings-daemon/plugins/media-keys" = {
					custom-keybindings = [
						"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
						"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
						"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
					];
					magnifier          = [ "" ];
					magnifier-zoom-in  = [ "" ];
					magnifier-zoom-out = [ "" ];
					screenreader       = [ "" ];
					screensaver        = [ "<Super>z" ];
				};

				"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
					binding = "<Super>Escape";
					command = "kgx -e bash -c 'tmux new-session -A -s main; bash'";
					name    = "gnome-terminal";
				};

				"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
					binding = "<Shift><Super>z";
					command = "gnome-session-quit --power-off";
					name    = "gnome-poweroff";
				};

				"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
					binding = "<Primary>Escape";
					command = "kgx -- btop";
					name    = "System Monitor";
				};

				"org/gnome/settings-daemon/plugins/power" = {
					ambient-enabled             = false;
					idle-dim                    = false;
					power-button-action         = "nothing";
					sleep-inactive-ac-timeout   = "0";
					sleep-inactive-ac-type      = "nothing";
					sleep-inactive-battery-type = "nothing";
				};

				"org/gnome/shell" = {
					disable-extension-version-validation = true;
					disable-user-extensions              = false;
					favorite-apps                        = [ "" ];
					had-bluetooth-devices-setup          = true;
					last-selected-power-profile          = "power-saver";
					remember-mount-password              = false;
				};

				"org/gnome/shell/app-switcher" = {
					current-workspace-only = true;
				};

				"org/gnome/shell/keybindings" = {
					focus-active-notification = [ "" ];
					open-application-menu     = [ "" ];
					show-screenshot-ui        = [ "<Super>v" ];
					switch-to-application-1   = [ "" ];
					switch-to-application-2   = [ "" ];
					switch-to-application-3   = [ "" ];
					switch-to-application-4   = [ "" ];
					switch-to-application-5   = [ "" ];
					switch-to-application-6   = [ "" ];
					switch-to-application-7   = [ "" ];
					switch-to-application-8   = [ "" ];
					switch-to-application-9   = [ "" ];
					toggle-application-view   = [ "" ];
					toggle-message-tray       = [ "" ];
					toggle-overview           = [ "" ];
					toggle-quick-settings     = [ "" ];
				};

				"org/gnome/shell/overrides" = {
					edge-tiling = false;
				};

				"org/gnome/software" = {
					download-updates        = false;
					download-updates-notify = false;
					first-run               = false;
					show-nonfree-prompt     = false;
				};

				"org/gnome/system/location" = {
					enabled = false;
				};

				"org/gtk/gtk4/settings/file-chooser" = {
					date-format            = "regular";
					location-mode          = "path-bar";
					show-hidden            = false;
					show-size-column       = true;
					show-type-column       = true;
					sidebar-width          = "166";
					sort-column            = "modified";
					sort-directories-first = true;
					sort-order             = "descending";
					type-format            = "category";
					view-type              = "list";
				};

				"org/gtk/settings/file-chooser" = {
					date-format            = "regular";
					location-mode          = "path-bar";
					show-hidden            = false;
					show-size-column       = true;
					show-type-column       = true;
					sort-column            = "modified";
					sort-directories-first = true;
					sort-order             = "descending";
					type-format            = "category";
				};

				"system/locale" = {
					region = "ru_RU.UTF-8";
				};

				"system/proxy" = {
					mode = "none";
				};
			};
		}];
	};
}
