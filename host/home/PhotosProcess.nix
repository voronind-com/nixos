{ pkgs, ... }: let
	script = ''
		in="/storage/hot/docker/cloud/data/data/cakee/files/media/photo/"
		out="/storage/cold_1/backup/tmp/photo/"
		docker run --rm -v "''${in}":/in -v "''${out}":/out voronind.com/photoprocess:latest
	'';
in {
	systemd.services.photos_process = {
		enable = true;
		description = "Process uploaded photos.";
		serviceConfig = {
			Type = "oneshot";
		};
		path = with pkgs; [
			docker
		];
		script = script;
	};

	systemd.timers.photos_process = {
		timerConfig = {
			OnCalendar = "daily";
			Persistent = true;
			Unit       = "photos_process.service";
		};
		wantedBy = [ "timers.target" ];
	};
}
