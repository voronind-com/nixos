{ util, config, lib, ... }: let
	internal = "10.0.0.1";
	external = "188.242.247.132";
	wifi     = "10.0.0.2";

	lan = "br0";
	wan = "enp8s0";
in {
	boot.kernel.sysctl = {
		"net.ipv4.conf.all.src_valid_mark" = 1;
		"net.ipv4.ip_forward" = 1;
	};

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

		firewall = {
			enable = lib.mkForce true;
			trustedInterfaces = [
				lan
			];
			extraCommands = let
				cfg = config.container.module;

				# mkForward = src: sport: dst: dport: proto: "iptables -t nat -I PREROUTING -i ${src} -p ${proto} --dport ${toString sport} -j DNAT --to-destination ${dst}:${toString dport}\n";
				mkForward = src: sport: dst: dport: proto: "iptables -t nat -I PREROUTING -d ${src} -p ${proto} --dport ${toString sport} -j DNAT --to-destination ${dst}:${toString dport}\n";
			in ''
				iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -d 0/0 -o ${wan} -j MASQUERADE
			''
			+ (mkForward internal cfg.dns.port cfg.dns.address cfg.dns.port "tcp")
			+ (mkForward internal cfg.dns.port cfg.dns.address cfg.dns.port "udp")

			+ (mkForward external 25  cfg.mail.address 25  "tcp")
			+ (mkForward internal 25  cfg.mail.address 25  "tcp")
			+ (mkForward internal 465 cfg.mail.address 465 "tcp")
			+ (mkForward internal 993 cfg.mail.address 993 "tcp")

			+ (mkForward internal cfg.zapret.port    cfg.zapret.address cfg.zapret.port    "tcp")
			+ (mkForward internal cfg.zapret.torport cfg.zapret.address cfg.zapret.torport "tcp")
			+ (mkForward internal cfg.zapret.port    cfg.zapret.address cfg.zapret.port    "udp")
			+ (mkForward internal cfg.zapret.torport cfg.zapret.address cfg.zapret.torport "udp")

			+ (mkForward external cfg.vpn.port cfg.vpn.address cfg.vpn.port "udp")

			+ (mkForward external cfg.proxy.port cfg.proxy.address cfg.proxy.port "tcp")
			+ (mkForward internal cfg.proxy.port cfg.proxy.address cfg.proxy.port "tcp")

			+ (mkForward external 54630 cfg.download.address 54630 "tcp")
			+ (mkForward external 54631 cfg.download.address 54631 "tcp")
			+ (mkForward external 54630 cfg.download.address 54630 "udp")
			+ (mkForward external 54631 cfg.download.address 54631 "udp")
			;

			interfaces = {
				"${wan}" = {
					allowedUDPPorts = [
					];
					allowedTCPPorts = [
						# 22143
					];
				};
				"${lan}" = {
					allowedUDPPorts = [
					];
					allowedTCPPorts = [
						22143
					];
				};
			};
		};

		bridges."${lan}".interfaces = [
			"enp6s0f0"
			"enp6s0f1"
		];

		interfaces = {
			"${lan}".ipv4 = {
				addresses = [{
					address      = internal;
					prefixLength = 24;
				}];
				routes = [
					{
						address      = "192.168.1.0";
						prefixLength = 24;
						via          = wifi;
					}
					{
						address      = "192.168.2.0";
						prefixLength = 24;
						via          = wifi;
					}
				];
			};
		};
	};
}
