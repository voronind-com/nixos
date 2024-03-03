{ pkgs, ... }: {
	systemd.services.nextcloud = {
		enable = true;
		description = "Nextcloud worker.";
		serviceConfig = {
			Type      = "oneshot";
			ExecStart = "/root/app/bin/home/Nextcloud";
		};
		path = with pkgs; [
			bashInteractive
			docker
		];
		# wantedBy = [ "multi-user.target" ];
	};

	systemd.timers.nextcloud = {
		timerConfig = {
			OnCalendar = "hourly";
			Persistent = false;
			Unit       = "nextcloud.service";
		};
		wantedBy = [ "timers.target" ];
	};
}
