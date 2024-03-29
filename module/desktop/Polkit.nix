{ pkgs, ... }: {
	security.polkit.enable = true;
	environment.systemPackages = with pkgs; [
		polkit_gnome
	];
}
