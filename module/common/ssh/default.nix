# SSH client configuration.
{ util, ... }: {
	config = util.trimTabs ''
		Host dasha
			HostName 192.168.1.7
			User root
			Port 22143

		Host desktop
			Hostname 192.168.1.3
			User root
			Port 22143

		Host fmpmaven
			Hostname 10.30.22.10
			User root
			Port 22

		Host fsight
			Hostname 10.30.217.25
			User root
			Port 22143

		Host home
			HostName 192.168.1.2
			User root
			Port 22143

		Host nixbuilder
			HostName 192.168.1.2
			User nixbuilder
			StrictHostKeyChecking=accept-new
			Port 22143

		Host laptop
			Hostname 192.168.1.9
			User root
			Port 22143

		Host pi
			Hostname 192.168.1.6
			User root
			Port 22143

		Host vpn
			Hostname 194.113.233.38
			User root
			Port 22143

		Host work
			Hostname 192.168.1.5
			User root
			Port 22143
	'';
}
