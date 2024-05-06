{ pkgs, ... } @args: let
	controlFile = "/sys/devices/system/cpu/intel_pstate/no_turbo";
	enable      = "1";
	disable     = "0";

	script = pkgs.writeShellScriptBin "powersave" (import ./powersave/Script.nix {
		controlFile = controlFile;
		disable     = "0";
		enable      = "1";
	}).script;
in {
	imports = [
		(import ./powersave ({
			inherit controlFile;
			inherit enable;
			inherit disable;
		} // args))
	];

	systemd.services.keyd.path = [ script ];
	environment.systemPackages = [ script ];
}
