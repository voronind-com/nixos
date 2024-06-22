{ secret, ... }: {
	config = {
		credential.helper          = "store";
		gpg.format                 = secret.crypto.sign.git.format;
		gpg.ssh.allowedSignersFile = toString secret.crypto.sign.git.allowed;
		init.defaultBranch         = "main";
		pull.rebase                = true;
		push.autoSetupRemote       = true;
		rebase.autoStash           = true;
		user.signingkey            = builtins.readFile secret.crypto.sign.git.key;
	};
}
