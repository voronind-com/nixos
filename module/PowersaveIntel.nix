# Intel CPU boost control.
{ pkgs, ... } @args: let
	controlFile = "/sys/devices/system/cpu/intel_pstate/no_turbo";
	enable      = "1";
	disable     = "0";

	script = pkgs.writeShellScriptBin "powersave" (import ./powersave/Script.nix {
		inherit controlFile enable disable;
	}).script;
in {
	imports = [
		(import ./powersave ({
			inherit controlFile enable disable;
		} // args))
	];

	environment.systemPackages = [ script ];
}
