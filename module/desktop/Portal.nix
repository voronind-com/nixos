# Portals are needed for Wayland apps to select files, screen shares etc.
{ pkgs, ... }: {
	xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [
			xdg-desktop-portal-gtk
		];
		config = {
			common = {
				default = [
					"gtk"
					"wlr"
				];
			};
		};
		wlr = {
			enable = true;
		};
		xdgOpenUsePortal = false;
	};
}
