{ secret, ... }: {
	programs.git = {
		enable = true;
		config = {
			credential.helper          = "store";
			init.defaultBranch         = "main";
			pull.rebase                = true;
			push.autoSetupRemote       = true;
			rebase.autoStash           = true;
			user.signingkey            = builtins.readFile secret.crypto.sign.git.key;
			gpg.ssh.allowedSignersFile = toString secret.crypto.sign.git.allowed;
			gpg.format                 = secret.crypto.sign.git.format;
		};
	};
}
