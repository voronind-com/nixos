{ ... }: {
	imports = [
		./Grub.nix
		./Root.nix
	];

	module.docker = {
		enable    = true;
		autostart = true;
		rootless  = false;
	};
}
