{ specialArgs, ... }: {
	users.users.root.hashedPassword = specialArgs.const.hashedPassword;
}
