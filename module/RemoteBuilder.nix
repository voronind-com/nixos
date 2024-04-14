{ pkgs, secret, lib, ... }: let
	keyPath = "/root/.nixbuilder";
in {
	systemd.services.generate-nix-cache-key = {
		wantedBy = [ "multi-user.target" ];
		serviceConfig.Type = "oneshot";
		path = [ pkgs.nix ];
		script = ''
			[[ -f "${keyPath}/private-key" ]] && exit
			mkdir ${keyPath} || true
			nix-store --generate-binary-cache-key "nixbuilder-1" "${keyPath}/private-key" "${keyPath}/public-key"
			nix store sign --all -k "${keyPath}/private-key"
		'';
	};

	users.groups.nixbuilder = {};
	users.users.nixbuilder = {
		openssh.authorizedKeys.keys = secret.ssh.builderKeys;
		description  = "Nix Remote Builder";
		isNormalUser = true;
		createHome   = lib.mkForce false;
		uid          = 1234;
		home         = "/";
		group        = "nixbuilder";
	};

	# To apply: nix store sign --all -k /path/to/secret-key-file
	nix.extraOptions = ''
		trusted-users = nixbuilder
		secret-key-files = ${keyPath}/private-key
	'';
}
