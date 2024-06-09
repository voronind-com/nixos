{ lib
, const
, host
, storage
, domain
, media
, ... }: {
	inherit host;

	mkContainer = config: cfg: lib.recursiveUpdate cfg {
		autoStart      = true;
		hostAddress    = host;
		localAddress   = config.address;
		privateNetwork = true;
	};

	mkContainerConfig = config: cfg: lib.recursiveUpdate cfg {
		system.stateVersion = const.stateVersion;

		nixpkgs.config.allowUnfree = true;

		users.users.root.password = "";
		users.mutableUsers = false;

		networking = {
			nameservers = [
				"1.1.1.1"
			];
			useHostResolvConf = lib.mkForce false;
			firewall.enable = false;
		};
	};

	mkContainerDir = cfg: dirs: map (path: "d '${cfg.storage}/${path}' 1777 root root - -") dirs;

	mkServer = cfg: lib.recursiveUpdate cfg {
		forceSSL = false;
	};

	localAccess = "192.168.1.0/24";

	config = {
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
		};
		paper = {
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
		photoprocess = {
			inherit (media) photo;
			address = "10.1.0.4";
			storage = "${storage}/photoprocess";
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
			inherit (media) book;
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
