{ inputs, ... }: {
	# Add a link for the active configuration to /etc/dotfiles.
	environment.etc.dotfiles.source = inputs.self;
}
