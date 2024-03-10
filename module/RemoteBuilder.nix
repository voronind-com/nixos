{ ... }: {
	# To apply: nix store sign --all -k /path/to/secret-key-file
	nix.extraOptions = ''
		extra-secret-key-files = /root/.nixcache/secret-key-file
	'';
}
