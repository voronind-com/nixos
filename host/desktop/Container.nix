{ pkgs, const, lib, config, util, ... }: let
	args = let
		storage = "/storage/hot/container";
		domain  = "local";
		host    = "192.168.1.3";
	in {
		inherit storage domain host pkgs const lib config util;

		container = import ../../container args;
	};
in {
	networking.nat = {
		enable = true;
		internalInterfaces = [ "ve-+" ];
		externalInterface = "enp4s0";
	};

	# TODO: Remove this.
	networking.extraHosts = ''
		10.1.0.2 change.local
		10.1.0.2 cloud.local
		10.1.0.2 paste.local
		10.1.0.2 local
	'';

	imports = [
		(import ../../container/Change.nix args)
		(import ../../container/Cloud.nix args)
		(import ../../container/Paste.nix args)
		(import ../../container/Postgres.nix args)
		(import ../../container/Proxy.nix args)
	];
}
