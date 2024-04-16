{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		adwsteamgtk
		evince
		gnome.adwaita-icon-theme
		gnome.gnome-calculator
		gnome.nautilus
		loupe
		gnome.gnome-font-viewer
		# gnome.gnome-keyring
	];

	# Nautilus previews.
	services.gnome.sushi.enable = true;

	# Nautilus network.
	services.gnome3.gvfs.enable = true;
}
