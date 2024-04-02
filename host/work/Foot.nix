{ lib, pkgs, color, ... }: {
	# Foot fontSize override.
	environment.variables.FOOT_CONFIG = lib.mkForce (import ../../module/foot/Init.nix { pkgs = pkgs; fontSize = 12; color = color; }).config;
}
