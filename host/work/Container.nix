{ pkgs, const, lib, config, util, ... }: let
	args = let
		storage = "/tmp/container";
		domain  = "local";
		host    = "192.168.0.174";
	in {
		inherit storage domain host pkgs const lib config util;
	};
in {
	networking.nat = {
		enable = true;
		internalInterfaces = [ "ve-+" ];
		externalInterface = "enp4s0";
	};

	# NOTE: Remove this.
	networking.extraHosts = ''
		10.1.0.2 paste.local
	'';

	imports = [
		(import ../../container/Paste.nix args)
		(import ../../container/Proxy.nix args)
	];
}
