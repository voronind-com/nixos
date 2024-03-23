{ ... }: {
	environment.variables.DOCKER_CONFIG = ./docker;
	virtualisation.docker.enable        = true;
}
