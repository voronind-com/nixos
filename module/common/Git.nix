{ ... }: {
	programs.git = {
		enable = true;
		config = {
			credential.helper    = "store";
			init.defaultBranch   = "main";
			pull.rebase          = true;
			push.autoSetupRemote = true;
			rebase.autoStash     = true;
		};
	};
}
