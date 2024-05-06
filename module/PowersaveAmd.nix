{ pkgs, ... } @args: let
	controlFile = "/sys/devices/system/cpu/cpufreq/boost";
	enable      = "1";
	disable     = "0";

	script = pkgs.writeShellScriptBin "powersave" (import ./powersave/Script.nix {
		controlFile = controlFile;
		disable     = "1";
		enable      = "0";
	}).script;
in {
	# Requirements:
	# CPPC (Collaborative Power Control) - Disabled.
	# PSS  (Cool and Quiet)              - Enabled.
	imports = [
		(import ./powersave ({
			inherit controlFile;
			inherit enable;
			inherit disable;
		} // args))
	];

	environment.systemPackages = [ script ];
}
