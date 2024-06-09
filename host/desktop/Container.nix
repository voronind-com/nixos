{ pkgs
, const
, lib
, config
, util
, poetry2nixJobber
, pkgsJobber
, ... }: let
	externalInterface  = "enp4s0";

	args = let
		storage = "/storage/hot/container";
		domain  = "local";
		host    = "192.168.1.3";
		media = {
			download = [ "/tmp/download" ];
			photo    = [ "/tmp/in" "/tmp/out" ];
			book     = [ "/tmp/book_1" "/tmp/book_2" ];
		};
	in {
		inherit storage domain host pkgs const lib config util media;
		inherit poetry2nixJobber pkgsJobber;

		container = import ../../container args;
	};
in {
	imports = [
		# (import ../../container/Proxy.nix args)
	];

	networking.nat = {
		enable = true;
		internalInterfaces = [ "ve-+" ];
		inherit externalInterface;

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
			{
				destination = "${proxy.address}:80";
				proto       = "tcp";
				sourcePort  = 80;
			} {
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
