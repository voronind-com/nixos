{ lib, ... }: {
	environment.variables.FOOT_CONFIG = lib.mkForce ./foot/Foot.ini;
}
