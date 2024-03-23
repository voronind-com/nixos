{ pkgs, ... }: {
	systemd.services.yandex_music = {
		enable = true;
		description = "Sync music from Yandex.Music.";
		serviceConfig = {
			Type      = "oneshot";
			ExecStart = ./bin/YandexMusic;
		};
		path = with pkgs; [
			bashInteractive
			docker
		];
		# wantedBy = [ "multi-user.target" ];
	};

	systemd.timers.yandex_music = {
		timerConfig = {
			OnCalendar = "daily";
			Persistent = true;
			Unit       = "yandex_music.service";
		};
		wantedBy = [ "timers.target" ];
	};
}
