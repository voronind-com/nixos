{ pkgs, ... }: {
	# Distrobox works best with Podman, so enable it here.
	imports = [ ./Podman.nix ];

	environment.systemPackages = with pkgs; [
		distrobox
	];
}
