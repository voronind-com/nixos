{ pkgs, ... }: {
	xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [
			xdg-desktop-portal-gnome
			xdg-desktop-portal-gtk
			xdg-desktop-portal-kde
		];
		config = {
			common = {
				default = [
					"gtk"
					"wlr"
					"gnome"
					"kde"
				];
			};
		};
		wlr = {
			enable = true;
		};
		xdgOpenUsePortal = true;
	};
}
