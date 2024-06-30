{ pkgs, __findFile, ... } @args: let
	package = import <package> args;
in {
	environment.systemPackages = package.core;

	# Special packages.
	programs = {
		adb.enable = true;
		git.enable = true;
		java = {
			enable  = true;
			package = pkgs.corretto21;
		};
	};
	services = {
		udisks2.enable = true;
	};
}
