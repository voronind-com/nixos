{ pkgs, util, lib, ... }: let
	storage = "/storage/hot/media/music";
	package = import ./yamusicdownload { inherit pkgs; };
	pattern = "#album-artist/#year_#album/#number_#title";
in {
	systemd.user = {
		services.yamusicdownload = let
			script = pkgs.writeText "YaMusicDownloadScript" (util.trimTabs ''
				[[ $UID = 0 ]] && exit 0

				function notify_silent() {
					curl -X POST -H 'Content-Type: Application/json' -d "{\"chat_id\":\"155897358\",\"text\":\"$1\",\"disable_notification\":\"true\"}" https://api.telegram.org/bot2046849441:AAHQpjRK4xpL8tEUyN4JTSDUUze4J0wSIy4/sendMessage &> /dev/null
				}

				cd ${storage}

				${package}/bin/yandex-music-downloader --browser "firefox" --hq --add-lyrics --embed-cover --skip-existing --stick-to-artist --only-music --path-pattern "${pattern}" --url https://music.yandex.ru/users/cakee.ru/playlists/3 && notify_silent "Music download complete." || notify_silent "Failed to download music!"
			'');
		in util.mkStaticSystemdService {
			enable = true;
			description = "Yandex Music Download.";
			serviceConfig = {
				Type      = "oneshot";
				ExecStart = "-${lib.getExe pkgs.bashInteractive} ${script}";
				Restart   = "on-failure";
			};
			path = with pkgs; [
				python313
				firefox-esr
			];
		};

		timers.yamusicdownload = {
			timerConfig = {
				OnCalendar = "daily";
				Persistent = true;
				Unit       = "yamusicdownload.service";
			};
			wantedBy = [ "timers.target" ];
		};
	};
}
