# Polkit agent is used by apps to ask for Root password with a popup.
{ pkgs, lib, ... }: {
	security.polkit.enable = true;
	systemd = {
		packages = with pkgs; [
			polkit-kde-agent
		];
		user = {
			services.plasma-polkit-agent = {
				serviceConfig = {
					Restart    = "always";
					RestartSec = 2;
					Slice      = "session.slice";
				};
				environment.PATH = lib.mkForce null;
				wantedBy = [ "gui-session.target" ];
			};
		};
	};
}
