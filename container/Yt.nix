{ container, pkgs, lib, config, ... }: with lib; let
	cfg = config.container.module.yt;
in {
	options = {
		container.module.yt = {
			enable = mkEnableOption "YouTube frontend.";
			address = mkOption {
				default = "10.1.0.19";
				type    = types.str;
			};
			port = mkOption {
				default = 3000;
				type    = types.int;
			};
			domain = mkOption {
				default = "yt.${config.container.domain}";
				type    = types.str;
			};
			storage = mkOption {
				default = "${config.container.storage}/yt";
				type    = types.str;
			};
		};
	};

	config = mkIf cfg.enable {
		containers.yt = container.mkContainer cfg {
			config = { ... }: container.mkContainerConfig cfg {
				services.invidious = {
					enable = true;
					domain = cfg.domain;
					port   = cfg.port;
					nginx.enable = false;
					database = {
						port = config.container.module.postgres.port;
						host = config.container.module.postgres.address;
						createLocally = false;
						passwordFile = "${pkgs.writeText "InvidiousDbPassword" "invidious"}";
					};
					settings = {
						admins               = [ "root" ];
						captcha_enabled      = false;
						check_tables         = true;
						registration_enabled = false;
						external_port        = 443;
						https_only           = true;
					};
				};

				systemd = {
					timers = {
						zapret = {
							timerConfig = {
								OnBootSec = 5;
								Unit      = "zapret.service";
							};
							wantedBy = [ "timers.target" ];
						};
						routes = {
							timerConfig = {
								OnBootSec = 5;
								Unit      = "routes.service";
							};
							wantedBy = [ "timers.target" ];
						};
					};

					services = {
						zapret = {
							description = "FRKN";
							wantedBy = [ ];
							requires = [ "network.target" ];
							path = with pkgs; [ zapret ];
							serviceConfig = {
								ExecStart  = "${pkgs.zapret}/bin/nfqws --pidfile=/run/nfqws.pid ${config.setting.zapret.params} --qnum=200";
								Type       = "simple";
								PIDFile    = "/run/nfqws.pid";
								ExecReload = "/bin/kill -HUP $MAINPID";
								Restart    = "always";
								RestartSec = "5s";
							};
						};
						routes = {
							description = "FRKN routes";
							wantedBy = [ ];
							requires = [ "network.target" ];
							path = with pkgs; [ iptables ];
							serviceConfig = {
								ExecStart = "${pkgs.iptables}/bin/iptables -t mangle -I POSTROUTING -p tcp -m multiport --dports 80,443 -m connbytes --connbytes-dir=original --connbytes-mode=packets --connbytes 1:6 -m mark ! --mark 0x40000000/0x40000000 -j NFQUEUE --queue-num 200 --queue-bypass";
								Type = "oneshot";
							};
						};
					};
				};
			};
		};
	};
}
