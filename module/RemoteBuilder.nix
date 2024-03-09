{ ... }: {
	nix.extraOptions = ''
		extra-secret-key-files = /root/.nixcache/secret-key-file
	'';
}
