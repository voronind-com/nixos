{ pkgs, style, util, ... } @args: let
	bash = import ../../module/common/bash/Init.nix args;
	script = pkgs.writeText "backupScript" ''
		source ${bash.modules}

		function report() {
			echo "''${*}"
			notify "''${*}"
		}

		# Define constants.
		path_src="/storage/hot"
		path_mount="/storage/cold_1"
		path_backup="''${path_mount}/backup"
		path_docker="''${path_backup}/home"
		path_media="/storage/cold_1/media /storage/cold_2/media"

		# Check if backup drive is mounted.
		if [ ! -f "''${path_mount}"/.mount ]; then
			report "Backup : ''${path_mount} not mounted!"
			exit 1
		fi

		# Check if hot storage is mounted.
		if [ ! -f "''${path_src}"/.mount ]; then
			report "Backup : ''${path_src} not mounted!"
			exit 1
		fi

		# Cd to src storage.
		cd "''${path_src}"

		# Save media list.
		find ''${path_media} -type d > ''${path_backup}/cold/ColdMedia.txt || report "Backup : Failed to save media list!"
		cd ''${path_backup}/cold/
		archive_fast ColdMedia.txt && rm ColdMedia.txt || report "Backup : Failed to archive media list!"
		cd -

		# Backup docker.
		docker=$(archive_fast docker/)
		bupsize=$(tdu ''${docker} | awk '{print $1}')
		mv ''${docker} ''${path_docker}/ || report "Backup : Failed to save docker!"

		# Backup some media.
		cd ''${path_src}/media/
		paper=$(archive_fast paper/)
		mv ''${paper} ''${path_backup}/paper/ || report "Backup : Failed to save paper!"
		cd -

		# Prune media copies.
		cd ''${path_backup}/paper/
		archive_prune Paper 7
		cd -

		cd ''${path_backup}/cold/
		archive_prune ColdMediaTxt 30
		cd -

		# Prune old Docker copies.
		cd ''${path_docker}
		archive_prune Docker 7
		cd -

		# Prune game saves.
		cd "''${path_backup}/save/"
		archive_prune
		cd -

		# Sync writes.
		sync

		# Notify completion & size.
		notify_silent "Backup : Complete ''${bupsize}."
		echo "Backup : Complete ''${bupsize}."
	'';
in {
	systemd.services.backup = {
		enable = true;
		description = "Home system backup.";
		serviceConfig = {
			Type = "oneshot";
		};
		path = with pkgs; [
			bashInteractive
			curl
			gnutar
			gzip
			gawk
			pv
		];
		script = ''
			${pkgs.bashInteractive}/bin/bash ${script}
		'';
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
