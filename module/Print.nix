{ ... }: {
	services.printing = {
		enable = true;
		clientConf = ''
			DigestOptions DenyMD5
			ServerName 192.168.1.2
		'';
	};
}
