{ lib
, const
, host
, storage
, domain
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

	config = {
		change = {
			address = "10.1.0.41";
			domain  = "change.${domain}";
			storage = "${storage}/change";
		};
		cloud = {
			address = "10.1.0.13";
			domain  = "cloud.${domain}";
			storage = "${storage}/cloud";
		};
		paste = {
			address = "10.1.0.14";
			domain  = "paste.${domain}";
			storage = "${storage}/paste";
		};
		proxy = {
			address = "10.1.0.2";
			storage = "${storage}/proxy";
		};
		postgres = {
			address = "10.1.0.3";
			storage = "${storage}/postgres";
		};
	};
}
