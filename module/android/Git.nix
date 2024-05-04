{ secret, ... }: {
	config = {
		credential.helper          = "store";
		gpg.format                 = secret.crypto.sign.format;
		gpg.ssh.allowedSignersFile = toString(secret.crypto.sign.allowed);
		init.defaultBranch         = "main";
		pull.rebase                = true;
		push.autoSetupRemote       = true;
		rebase.autoStash           = true;
		user.signingkey            = builtins.readFile secret.crypto.sign.key;
	};
}
