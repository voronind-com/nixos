{ pkgs, ... }: let
	script = ''
		music="/storage/hot/media/music/"
		docker run --rm -v "''${music}":/music voronind.com/yamusic:latest
	'';
in {
	systemd.services.yandex_music = {
		enable = true;
		description = "Sync music from Yandex.Music.";
		serviceConfig = {
			Type = "oneshot";
		};
		path = with pkgs; [
			docker
		];
		script = script;
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
