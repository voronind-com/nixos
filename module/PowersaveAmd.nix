# AMD CPU boost control.
{ pkgs, ... } @args: let
	controlFile = "/sys/devices/system/cpu/cpufreq/boost";
	enable      = "0";
	disable     = "1";

	script = pkgs.writeShellScriptBin "powersave" (import ./powersave/Script.nix {
		inherit controlFile enable disable;
	}).script;
in {
	# Requirements:
	# CPPC (Collaborative Power Control) - Disabled.
	# PSS  (Cool and Quiet)              - Enabled.
	imports = [
		(import ./powersave ({
			inherit controlFile enable disable;
		} // args))
	];

	environment.systemPackages = [ script ];
}
