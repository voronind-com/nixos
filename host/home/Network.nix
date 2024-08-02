{ util, ... }: {
	networking = {
		networkmanager.insertNameservers = [
			"1.1.1.1"
			"8.8.8.8"
		];
		extraHosts = util.trimTabs ''
			10.1.0.2 git.voronind.com
			10.1.0.2 iot.voronind.com
			10.1.0.2 pass.voronind.com
		'';
	};
}
