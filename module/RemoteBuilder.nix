{ pkgs, ... }: let
	keyPath = "/root/.nixcache";
in {
	systemd.services.generate-nix-cache-key = {
		wantedBy = [ "multi-user.target" ];
		serviceConfig.Type = "oneshot";
		path = [ pkgs.nix ];
		script = ''
			[[ -f "${keyPath}/private-key" ]] && exit
			mkdir ${keyPath} || true
			nix-store --generate-binary-cache-key "$HOSTNAME-1" "${keyPath}/private-key" "${keyPath}/public-key"
		'';
	};
	# To apply: nix store sign --all -k /path/to/secret-key-file
	nix.extraOptions = ''
		secret-key-files = /root/.nixcache/private-key
	'';
}
