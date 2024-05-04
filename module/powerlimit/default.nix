# Control battery charge limits. Control with `powerlimit` script.
{ pkgs
, lib
, controlFileMax
, controlFileMin
, onMax
, onMin
, offMax
, offMin
, ... }: {
	systemd = {
		services.powerlimit = {
			description = "Limit battery charge.";
			enable      = true;
			wantedBy    = [ "multi-user.target" ];
			serviceConfig = {
				Type = "simple";
				RemainAfterExit = "yes";
				ExecStart = "${lib.getExe pkgs.bash} -c 'echo ${onMin} > ${controlFileMin}; echo ${onMax} > ${controlFileMax};'";
				ExecStop  = "${lib.getExe pkgs.bash} -c 'echo ${offMax} > ${controlFileMax}; echo ${offMin} > ${controlFileMin};'";
			};
		};

		# HACK: Allow user access.
		tmpfiles.rules = [
			"z ${controlFileMax} 0777 - - - -"
			"z ${controlFileMin} 0777 - - - -"
		];
	};
}

