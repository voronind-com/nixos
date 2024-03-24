{ pkgs, ... }: {
	systemd.services.backup = {
		enable = true;
		description = "Home system backup.";
		serviceConfig = {
			Type      = "oneshot";
			ExecStart = ./bin/Backup;
		};
		path = with pkgs; [
			bashInteractive
			curl
			gnutar
			gzip
			gawk
			pv
		];
		environment = {
			BASH_PATH = ../../module/common/bash;
		};
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
