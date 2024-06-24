{ pkgs
, const
, lib
, config
, util
, poetry2nixJobber
, pkgsJobber
, pkgsMaster
, pkgsStable
, ... }: let
	args = let
		# Path where all the container data will be stored.
		storage = "/storage/hot/container";

		# Domain used to host stuff. All the services will be like `service.${domain}`.
		domain  = "voronind.com";

		# External IP address of the host, where all the services will listen to.
		host    = "192.168.1.2";

		# External interface where all the services will listen on.
		externalInterface = "enp7s0";

		# Paths to media content. Later they can be plugged to the containers using the `attachMedia "photo"` function.
		media = {
			anime    = [ "/storage/cold_1/media/anime" "/storage/cold_2/media/anime" ];
			book     = [ "/storage/hot/media/book" ];
			download = [ "/storage/hot/download" ];
			manga    = [ "/storage/cold_1/media/manga" "/storage/cold_2/media/manga" ];
			movie    = [ "/storage/cold_1/media/movie" "/storage/cold_2/media/movie" ];
			music    = [ "/storage/cold_2/media/music" ];
			paper    = [ "/storage/hot/media/paper" ];
			porn     = [ "/storage/cold_2/media/porn" ];
			photo    = [ "${storage}/cloud/data/data/cakee/files/media/photo" "/storage/cold_1/backup/tmp/photo" ];
			show     = [ "/storage/cold_1/media/show" "/storage/cold_2/media/show" ];
			study    = [ "/storage/cold_1/media/study" "/storage/cold_2/media/study" ];
			work     = [ "/storage/cold_2/media/work" ];
			youtube  = [ "/storage/cold_1/media/youtube" "/storage/cold_2/media/youtube" ];
		};
	in {
		# Pass all the arguments further.
		inherit storage domain host pkgs const lib config util media externalInterface;
		inherit poetry2nixJobber pkgsJobber;
		inherit pkgsMaster pkgsStable;

		# Pass the global container configuration.
		container = import ../../container args;
	};
in {
	# List of containers enabled on this host.
	imports = [
		(import ../../container/Change.nix args)
		(import ../../container/Cloud.nix args)
		(import ../../container/Ddns.nix args)
		(import ../../container/Dns.nix args)
		(import ../../container/Download.nix args)
		(import ../../container/Git.nix args)
		# (import ../../container/Hdd.nix args)
		(import ../../container/Home.nix args)
		(import ../../container/Iot.nix args)
		(import ../../container/Jobber.nix args)
		(import ../../container/Mail.nix args)
		(import ../../container/Office.nix args)
		(import ../../container/Paper.nix args)
		(import ../../container/Pass.nix args)
		(import ../../container/Paste.nix args)
		(import ../../container/Postgres.nix args)
		(import ../../container/Print.nix args)
		(import ../../container/Proxy.nix args)
		(import ../../container/Rabbitmq.nix args)
		(import ../../container/Read.nix args)
		(import ../../container/Redis.nix args)
		(import ../../container/Search.nix args)
		(import ../../container/Status.nix args)
		(import ../../container/Stock.nix args)
		(import ../../container/Vpn.nix args)
		(import ../../container/Watch.nix args)
		(import ../../container/Yt.nix args)
	];

	# This is the network for all the containers.
	# They are not available to the external interface by default,
	# instead they all expose specific ports in their configuration.
	networking.nat = {
		enable = true;
		internalInterfaces = [ "ve-+" ];
		inherit (args) externalInterface;
	};
}
