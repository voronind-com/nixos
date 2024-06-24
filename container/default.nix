{ lib
, const
, host
, storage
, domain
, media
, pkgs
, ... }: {
	inherit host;

	# Common configuration for all the containers.
	mkContainer = config: cfg: lib.recursiveUpdate {
		# Start containers with the system by default.
		autoStart = true;

		# IP Address of the host. This is required for container to have access to the Internet.
		hostAddress = host;

		# Container's IP address.
		localAddress = config.address;

		# Isolate container from other hosts.
		privateNetwork = true;
	} cfg;

	# Common configuration for the system inside the container.
	mkContainerConfig = config: cfg: lib.recursiveUpdate {
		# HACK: Do not evaluate nixpkgs inside the container. Use host's instead.
		nixpkgs.pkgs = lib.mkForce pkgs;

		# Release version.
		system.stateVersion = const.stateVersion;

		# Allow passwordless login as root.
		users.users.root.password = "";
		users.mutableUsers = false;

		networking = {
			# Default DNS servers.
			nameservers = [
				"1.1.1.1"
			];

			# HACK: Fix for upstream issue: https://github.com/NixOS/nixpkgs/issues/162686
			useHostResolvConf = lib.mkForce false;

			# Disable firewall.
			firewall.enable = false;
		};
	} cfg;

	# Create a directory on the host for container use.
	mkContainerDir = cfg: dirs: map (path: "d '${cfg.storage}/${path}' 1777 root root - -") dirs;

	# Common configuration for Nginx server.
	mkServer = cfg: lib.recursiveUpdate {
		forceSSL = false;
	} cfg;

	# Attach the host media directory to container.
	# They will be added to /type/{0..9}
	attachMedia = type: paths: ro: builtins.listToAttrs (lib.imap0 (i: path:
		{
			name = "/${type}/${toString i}";
			value = {
				hostPath   = path;
				isReadOnly = ro;
			};
		}
	) paths);

	# Range of local addresses who have access to sensitive paths like admin panels.
	# Other addresses will get 403.
	localAccess = "192.168.1.0/24";

	# Per-container configurations.
	config = {
		camera = {
			address = "192.168.2.249";
			domain  = "camera.${domain}";
			port    = "554";
		};
		change = {
			address = "10.1.0.41";
			port    = 5000;
			domain  = "change.${domain}";
			storage = "${storage}/change";
		};
		cloud = {
			address = "10.1.0.13";
			port    = 80;
			domain  = "cloud.${domain}";
			storage = "${storage}/cloud";
		};
		ddns = {
			address = "10.1.0.31";
			port    = 53;
			storage = "${storage}/ddns";
		};
		dns = {
			address = "10.1.0.6";
		};
		download = {
			inherit (media) download;
			address = "10.1.0.12";
			port    = 8112;
			domain  = "download.${domain}";
			storage = "${storage}/download";
		};
		git = {
			address = "10.1.0.8";
			port    = 3000;
			domain  = "git.${domain}";
			storage = "${storage}/git";
		};
		hdd = {
			address = "10.1.0.10";
			port    = 8080;
			domain  = "hdd.${domain}";
			storage = "${storage}/hdd";
		};
		home = {
			address = "10.1.0.18";
			port    = 80;
			domain  = "home.${domain}";
		};
		iot = {
			inherit (media) photo;
			address = "10.1.0.27";
			domain  = "iot.${domain}";
			port    = 8123;
			storage = "${storage}/iot";
		};
		jobber = {
			address = "10.1.0.32";
			storage = "${storage}/jobber";
		};
		mail = {
			address = "10.1.0.5";
			domain  = "mail.${domain}";
			port    = 80;
			storage = "${storage}/mail";
		};
		office = {
			address = "10.1.0.21";
			domain  = "office.${domain}";
			port    = 8000;
			storage = "${storage}/office";
		};
		paper = {
			inherit (media) paper;
			address = "10.1.0.40";
			domain  = "paper.${domain}";
			port    = 28981;
			storage = "${storage}/paper";
		};
		pass = {
			address = "10.1.0.9";
			domain  = "pass.${domain}";
			port    = 8000;
			storage = "${storage}/pass";
		};
		paste = {
			address = "10.1.0.14";
			domain  = "paste.${domain}";
			port    = 80;
			storage = "${storage}/paste";
		};
		print = {
			domain  = "print.${domain}";
			address = "10.1.0.46";
			port    = 631;
			storage = "${storage}/print";
		};
		printer = {
			address = "192.168.2.237";
			domain  = "printer.${domain}";
			port    = 80;
		};
		proxy = {
			address = "10.1.0.2";
			storage = "${storage}/proxy";
		};
		postgres = {
			address = "10.1.0.3";
			port    = 5432;
			storage = "${storage}/postgres";
		};
		rabbitmq = {
			address = "10.1.0.28";
			port    = 5672;
			storage = "${storage}/rabbitmq";
		};
		read = {
			inherit (media) book manga;
			address = "10.1.0.39";
			domain  = "read.${domain}";
			port    = 5000;
			storage = "${storage}/read";
		};
		redis = {
			address = "10.1.0.38";
			port    = 6379;
		};
		router = {
			address = "192.168.1.1";
			domain  = "router.${domain}";
			port    = 80;
		};
		search = {
			address = "10.1.0.26";
			domain  = "search.${domain}";
			port    = 8080;
		};
		status = {
			address = "10.1.0.22";
			domain  = "status.${domain}";
			port    = 3001;
			storage = "${storage}/status";
		};
		stock = {
			address = "10.1.0.45";
			domain  = "stock.${domain}";
			port    = 80;
			storage = "${storage}/stock";
		};
		vpn = {
			address = "10.1.0.23";
			port    = 51820;
			storage = "${storage}/vpn";
		};
		watch = {
			inherit (media) anime download movie music photo porn show study work youtube;
			address = "10.1.0.11";
			domain  = "watch.${domain}";
			port    = 8096;
			storage = "${storage}/watch";
		};
		yt = {
			address = "10.1.0.19";
			domain  = "yt.${domain}";
			port    = 3000;
		};
	};
}
