{ ... }: {
	environment.variables.DOCKER_CONFIG = ./docker;
	virtualisation.docker.enable = true;
	virtualisation.docker.rootless = {
		enable = true;
		setSocketVariable = true;
	};
}
