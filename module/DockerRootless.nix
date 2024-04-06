{ pkgs, key, util, ... } @args: let
	docker = import ./docker/Init.nix args;
	config = pkgs.writeText "dockerConfig" docker.text;
in {
	environment.variables.DOCKER_CONFIG = config;
	virtualisation.docker.enable = true;
	virtualisation.docker.rootless = {
		enable = true;
		setSocketVariable = true;
	};
}
