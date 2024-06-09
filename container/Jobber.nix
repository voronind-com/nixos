{ container, pkgsJobber, poetry2nixJobber, lib, ... } @args: let
	cfg    = container.config.jobber;
	script = import ./jobber { poetry2nix = poetry2nixJobber; pkgs = pkgsJobber; };
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.jobber = container.mkContainer cfg {
		bindMounts = {
			"/data" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = true;
			};
		};

		enableTun = true;

		config = { lib, ... }: let
			packages = [ script ] ++ (with pkgsJobber; [
				firefox
				geckodriver
				openvpn
				python311
			]);
		in container.mkContainerConfig cfg {
			networking = lib.mkForce {
				nameservers = [
					"10.9.0.5"
				];
			};

			systemd.services.jobber = {
				description = "My job is pushing the button.";
				enable      = true;
				wantedBy    = [ "multi-user.target" ];
				path        = packages;
				environment = {
					PYTHONUNBUFFERED        = "1";
					PYTHONDONTWRITEBYTECODE = "1";
				};
				serviceConfig = {
					Type      = "simple";
					ExecStart = "${script}/bin/jobber -u";
					Restart   = "on-failure";
				};
			};
		};
	};
}
