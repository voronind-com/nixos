{ pkgs, ... }: {
	services.nix-serve = {
		enable        = true;
		bindAddress   = "0.0.0.0";
		package       = pkgs.nix-serve-ng;
		port          = 5000;
		secretKeyFile = "/root/nixcache/secret-key-file"; # Generate with: nix-store --generate-binary-cache-key nixcache.voronind.com secret-key-file public-key-file
	};
}
