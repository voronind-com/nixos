{ pkgs, ... }: {
	systemd.services.photos_process = {
		enable = true;
		description = "Process uploaded photos.";
		serviceConfig = {
			Type      = "oneshot";
			ExecStart = "/etc/bin/PhotosProcess";
		};
		path = with pkgs; [
			bashInteractive
			docker
		];
		# wantedBy = [ "multi-user.target" ];
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
