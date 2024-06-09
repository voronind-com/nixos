# I want to pull all the Apk files in their current state
# so that I always have an access to clients that match
# my service versions.
{ pkgs, ... } @args: let
	package = (pkgs.callPackage ./apks args);
in {
	environment.etc.apks.source = package;
}
