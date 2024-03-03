{ pkgs, ... }: {
	systemd.services.backup = {
		enable = true;
		description = "Home system backup.";
		serviceConfig = {
			Type      = "oneshot";
			ExecStart = "/root/app/bin/home/Backup";
		};
		path = with pkgs; [
			bashInteractive
			curl
			gnutar
			gzip
			gawk
			pv
		];
		# wantedBy = [ "multi-user.target" ];
	};

	systemd.timers.backup = {
		timerConfig = {
			OnCalendar = "*-*-* 06:00:00";
			Persistent = true;
			Unit       = "backup.service";
		};
		wantedBy = [ "timers.target" ];
	};
}
