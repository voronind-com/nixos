{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		networkmanager-l2tp
		gnome.networkmanager-l2tp
		# networkmanager_strongswan
		# strongswan
		# strongswanNM
	];
	networking.networkmanager.enableStrongSwan = true;
	services.xl2tpd.enable = true;
	services.strongswan = {
		enable = true;
		secrets = [
			"ipsec.d/ipsec.nm-l2tp.secrets"
		];
	};
	# NOTE: Try this if VPN ever breaks.
	# systemd.tmpfiles.rules = [
	# 	"L /etc/ipsec.secrets - - - - /etc/ipsec.d/ipsec.nm-l2tp.secrets"
	# ];
}