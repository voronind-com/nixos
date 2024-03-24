{ pkgs, ... }: {
	systemd.services.nextcloud = {
		enable = true;
		description = "Nextcloud worker.";
		serviceConfig = {
			Type      = "oneshot";
			ExecStart = ./bin/Nextcloud;
		};
		path = with pkgs; [
			bashInteractive
			docker
		];
		environment = {
			BASH_PATH = ../../module/common/bash;
		};
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
