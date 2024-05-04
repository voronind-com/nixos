# Module that enables remote builds. This is a server configuration.
{ pkgs, secret, lib, ... }: let
	keyPath = "/root/.nixbuilder";
in {
	# Service that generates new key on boot if not present.
	# Don't forget to add new key to secret.ssh.builderKeys.
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

	# Add `nixbuilder` restricted user.
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

	# Sign store automatically.
	# Sign existing store with: nix store sign --all -k /path/to/secret-key-file
	nix.extraOptions = ''
		trusted-users = nixbuilder
		secret-key-files = ${keyPath}/private-key
	'';
}
