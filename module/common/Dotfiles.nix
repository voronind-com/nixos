{ inputs, ... }: {
	# Easy to find copy just in case.
	environment.etc.dotfiles.source = inputs.self;
}
