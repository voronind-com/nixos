{ container, lib, config, ... }: with lib; let
	cfg = config.container.module.iot;
in {
	options = {
		container.module.iot = {
			enable = mkEnableOption "IoT service.";
			address = mkOption {
				default = "10.1.0.27";
				type    = types.str;
			};
			port = mkOption {
				default = 8123;
				type    = types.int;
			};
			domain = mkOption {
				default = "iot.${config.container.domain}";
				type    = types.str;
			};
			storage = mkOption {
				default = "${config.container.storage}/iot";
				type    = types.str;
			};
		};
	};

	config = mkIf cfg.enable {
		systemd.tmpfiles.rules = container.mkContainerDir cfg [
			"data"
		];

		containers.iot = container.mkContainer cfg {
			bindMounts = {
				"/var/lib/hass" = {
					hostPath   = "${cfg.storage}/data";
					isReadOnly = false;
				};
				"/dev/ttyACM0" = {
					hostPath   = "/dev/ttyACM0";
					isReadOnly = false;
				};
				"/dev/serial/by-id" = {
					hostPath   = "/dev/serial/by-id";
					isReadOnly = false;
				};
			} // container.attachMedia "photo" true;

			allowedDevices = [
				{
					modifier = "rwm";
					node = "/dev/ttyACM0";
				}
			];

			config = { ... }: container.mkContainerConfig cfg {
				# Allow Hass to talk to Zigbee dongle.
				users.users.hass.extraGroups = [ "dialout" "tty" ];

				services.home-assistant = {
					# NOTE: Missing: hacs. Inside hacs: `card-mod`, `Clock Weather Card`, `WallPanel` and `Yandex.Station`.
					enable = true;
					extraComponents = [
						"caldav"
						"met"
						"sun"
						"systemmonitor"
						"zha"
					];
					extraPackages = python3Packages: with python3Packages; [
						aiodhcpwatcher
						aiodiscover
						aiogithubapi
						async-upnp-client
						ha-av
						ha-ffmpeg
						hassil
						home-assistant-intents
						mutagen
						numpy
						pynacl
						pyturbojpeg
						python-telegram-bot
						zeroconf
					];
					configDir = "/var/lib/hass";
					# lovelaceConfig = {
					# 	title = "Home IoT control center.";
					# };
					# NOTE: Using imperative config because of secrets.
					config = null;
				};
			};
		};
	};
}
