{ key, ... }: let
	mod = key.gnome.mod;
in {
	"org/gnome/desktop/wm/keybindings" = {
		activate-window-menu         = [ "" ];
		begin-move                   = [ "" ];
		begin-resize                 = [ "${mod}${key.action.resize.begin}" ];
		close                        = [ "${mod}${key.action.close}" ];
		cycle-group                  = [ "" ];
		cycle-group-backward         = [ "" ];
		cycle-panels                 = [ "" ];
		cycle-panels-backward        = [ "" ];
		cycle-windows                = [ "" ];
		cycle-windows-backward       = [ "" ];
		maximize                     = [ "" ];
		maximize-horizontally        = [ "" ];
		minimize                     = [ "${mod}${key.navigation.go.down}" ];
		move-to-monitor-down         = [ "" ];
		move-to-monitor-left         = [ "" ];
		move-to-monitor-right        = [ "" ];
		move-to-monitor-up           = [ "" ];
		move-to-workspace-1          = [ "" ];
		move-to-workspace-2          = [ "" ];
		move-to-workspace-3          = [ "" ];
		move-to-workspace-4          = [ "" ];
		move-to-workspace-last       = [ "" ];
		move-to-workspace-left       = [ "<Shift>${mod}${key.navigation.move.prev}" ];
		move-to-workspace-right      = [ "<Shift>${mod}${key.navigation.move.next}" ];
		panel-run-dialog             = [ "${mod}${key.action.launch}" ];
		show-desktop                 = [ "${mod}${key.action.hide}" ];
		switch-applications          = [ "${mod}${key.gnome.window.switch}" ];
		switch-applications-backward = [ "<Shift>${mod}${key.gnome.window.switch}" ];
		switch-group                 = [ "<Alt>${key.gnome.window.switch}" ];
		switch-group-backward        = [ "<Shift><Alt>${key.gnome.window.switch}" ];
		switch-input-source          = [ "" ];
		switch-input-source-backward = [ "" ];
		switch-panels                = [ "" ];
		switch-panels-backward       = [ "" ];
		switch-to-workspace-1        = [ "" ];
		switch-to-workspace-2        = [ "" ];
		switch-to-workspace-3        = [ "" ];
		switch-to-workspace-4        = [ "" ];
		switch-to-workspace-last     = [ "" ];
		switch-to-workspace-left     = [ "${mod}${key.navigation.go.prev}" ];
		switch-to-workspace-right    = [ "${mod}${key.navigation.go.next}" ];
		switch-windows               = [ "" ];
		switch-windows-backward      = [ "" ];
		toggle-fullscreen            = [ "${mod}${key.gnome.window.fullscreen}" ];
		toggle-maximized             = [ "${mod}${key.navigation.go.up}" ];
		unmaximize                   = [ "" ];
	};

	"org/gnome/mutter/keybindings" = {
		toggle-tiled-left  = [ "${mod}${key.navigation.go.left}" ];
		toggle-tiled-right = [ "${mod}${key.navigation.go.right}" ];
	};

	"org/gnome/mutter/wayland/keybindings" = {
		restore-shortcuts = [ "" ];
	};

	"org/gnome/settings-daemon/plugins/media-keys" = {
		custom-keybindings = [
			"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
		];
		magnifier          = [ "" ];
		magnifier-zoom-in  = [ "" ];
		magnifier-zoom-out = [ "" ];
		screenreader       = [ "" ];
		screensaver        = [ "${mod}${key.action.wait}" ];
	};

	"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
		binding = "${mod}${key.gnome.launch.terminal}";
		command = "kgx -e bash -c 'tmux new-session -A -s main; bash'";
		name    = "gnome-terminal";
	};

	"org/gnome/shell/keybindings" = {
		focus-active-notification = [ "" ];
		open-application-menu     = [ "" ];
		show-screenshot-ui        = [ "${mod}${key.gnome.screenshot}" ];
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
}
