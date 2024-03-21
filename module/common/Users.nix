{ ... }: {
	security.loginDefs.settings.UMASK = "077";
	users.mutableUsers = false;
}
