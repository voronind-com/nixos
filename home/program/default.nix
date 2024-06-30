{ secret, ... } @args: {
	home-manager.enable = true;

	gpg = {
		enable = true;
		inherit (secret.crypto) publicKeys;
	};

	firefox = import ./firefox args;
}
