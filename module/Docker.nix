{ environment, ... }: {
	environment.etc.docker.source       = ./docker;
	environment.variables.DOCKER_CONFIG = "/etc/docker";
	virtualisation.docker.enable        = true;
}
