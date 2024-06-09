{ container, ... } @args: let
	cfg = container.config.iot;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.iot = container.mkContainer cfg {
		bindMounts = {
			"/var/lib/hass" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = false;
			};
			# "/photo" = {
			# 	hostPath   = "${cfg.photos}";
			# 	isReadOnly = true;
			# };
			# "/dev/ttyACM0" = {
			# 	hostPath   = "/dev/ttyACM0";
			# 	isReadOnly = false;
			# };
			# "/dev/serial/by-id" = {
			# 	hostPath   = "/dev/serial/by-id";
			# 	isReadOnly = false;
			# };
		};

		config = { pkgs, ... }: container.mkContainerConfig cfg {
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
					async-upnp-client
					ha-av
					ha-ffmpeg
					hassil
					home-assistant-intents
					mutagen
					numpy
					pynacl
					pyturbojpeg
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
}
