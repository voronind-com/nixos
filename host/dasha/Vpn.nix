{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		networkmanager-l2tp
		gnome.networkmanager-l2tp
		# networkmanager_strongswan
		# strongswan
		# strongswanNM
	];
}
