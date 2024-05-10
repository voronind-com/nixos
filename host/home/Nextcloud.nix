{ pkgs, style, util, ... } @args: let
	bash = import ../../module/common/bash args;
	script = ''
		docker exec -u 33 cloud php -f /var/www/html/cron.php || notify 'Nextcloud : Failed to run cron.'
	'';
in {
	systemd.services.nextcloud = util.mkStaticSystemdService {
		enable = true;
		description = "Nextcloud worker.";
		serviceConfig = {
			Type = "oneshot";
		};
		path = with pkgs; [
			bashInteractive
			docker
		];
		script = ''
			${pkgs.bashInteractive}/bin/bash ${script}
		'';
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
