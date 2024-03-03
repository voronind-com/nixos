{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		openssl
		gnome.gnome-remote-desktop
	];
}
