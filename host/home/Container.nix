{ pkgs
, const
, lib
, config
, util
, poetry2nixJobber
, pkgsJobber
, ... }: let
	args = let
		storage = "/storage/hot/container";
		domain  = "voronind.com";
		host    = "192.168.1.2";
		externalInterface  = "enp7s0";
		media = {
			anime    = [ "/storage/cold_1/media/anime" "/storage/cold_2/media/anime" ];
			book     = [ "/storage/hot/media/book" ];
			download = [ "/storage/hot/download" ];
			manga    = [ "/storage/cold_1/media/manga" "/storage/cold_2/media/manga" ];
			movie    = [ "/storage/cold_1/media/movie" "/storage/cold_2/media/movie" ];
			music    = [ "/storage/hot/media/music" "/storage/cold_2/media/music" ];
			paper    = [ "/storage/hot/media/paper" ];
			porn     = [ "/storage/cold_2/media/porn" ];
			photo    = [ "${storage}/cloud/data/data/cakee/files/media/photo" "/storage/cold_1/backup/tmp/photo" ];
			show     = [ "/storage/cold_1/media/show" "/storage/cold_2/media/show" ];
			study    = [ "/storage/cold_1/media/study" "/storage/cold_2/media/study" ];
			work     = [ "/storage/cold_2/media/work" ];
			youtube  = [ "/storage/cold_1/media/youtube" "/storage/cold_2/media/youtube" ];
		};
	in {
		inherit storage domain host pkgs const lib config util media externalInterface;
		inherit poetry2nixJobber pkgsJobber;

		container = import ../../container args;
	};
in {
	imports = [
		(import ../../container/Change.nix args)
		(import ../../container/Cloud.nix args)
		# (import ../../container/Ddns.nix args)
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
		(import ../../container/Photoprocess.nix args)
		(import ../../container/Postgres.nix args)
		(import ../../container/Print.nix args)
		(import ../../container/Proxy.nix args)
		(import ../../container/Rabbitmq.nix args)
		(import ../../container/Read.nix args)
		(import ../../container/Redis.nix args)
		(import ../../container/Search.nix args)
		# (import ../../container/Status.nix args)
		(import ../../container/Stock.nix args)
		(import ../../container/Vpn.nix args)
		(import ../../container/Watch.nix args)
		(import ../../container/Yt.nix args)
	];

	networking.nat = {
		enable = true;
		internalInterfaces = [ "ve-+" ];
		inherit (args) externalInterface;

		forwardPorts = with args.container.config; [
			# Dns Server.
			{
				destination = "${dns.address}:53";
				proto       = "udp";
				sourcePort  = 53;
			} {
				destination = "${dns.address}:53";
				proto       = "tcp";
				sourcePort  = 53;
			}

			# Reverse proxy.
			#{
			#	destination = "${proxy.address}:80";
			#	proto       = "tcp";
			#	sourcePort  = 80;
			#} {
			{
				destination = "${proxy.address}:443";
				proto       = "tcp";
				sourcePort  = 443;
			}

			# Cups.
			{
				destination = "${print.address}:${toString print.port}";
				proto       = "tcp";
				sourcePort  = 631;
			} {
				destination = "${print.address}:6566";
				proto       = "tcp";
				sourcePort  = 6566;
			}

			# Wireguard.
			{
				destination = "${vpn.address}:${toString vpn.port}";
				proto       = "udp";
				sourcePort  = 51820;
			}

			# Deluge.
			{
				destination = "${download.address}:${toString download.port}";
				proto       = "tcp";
				sourcePort  = 8112;
			} {
				destination = "${download.address}:54630-54631";
				proto       = "udp";
				sourcePort  = "54630:54631";
			} {
				destination = "${download.address}:54630-54631";
				proto       = "tcp";
				sourcePort  = "54630:54631";
			}

			# Mail.
			{
				destination = "${mail.address}:25";
				proto       = "tcp";
				sourcePort  = 25;
			} {
				destination = "${mail.address}:465";
				proto       = "tcp";
				sourcePort  = 465;
			} {
				destination = "${mail.address}:993";
				proto       = "tcp";
				sourcePort  = 993;
			}
		];
	};
}
