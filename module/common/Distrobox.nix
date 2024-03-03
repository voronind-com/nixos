{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		distrobox
	];

	virtualisation = {
		podman = {
			enable = true;
			defaultNetwork.settings.dns_enabled = false;
			dockerCompat = false;
		};
	};
}
