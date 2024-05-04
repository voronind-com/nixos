# ThinkPad charge limits.
{ pkgs, lib, ... } @args: let
	controlFileMin = "/sys/class/power_supply/BAT0/charge_control_start_threshold";
	controlFileMax = "/sys/class/power_supply/BAT0/charge_control_end_threshold";

	onMin  = "40";
	onMax  = "80";
	offMin = "90";
	offMax = "95";

	script = pkgs.writeShellScriptBin "powerlimit" (import ./powerlimit/Script.nix {
		inherit controlFileMax;
		inherit controlFileMin;
		inherit onMin;
		inherit onMax;
		inherit offMin;
		inherit offMax;
	}).script;
in {
	imports = [
		(import ./powerlimit ({
			inherit controlFileMax;
			inherit controlFileMin;
			inherit onMin;
			inherit onMax;
			inherit offMin;
			inherit offMax;
		} // args))
	];

	environment.systemPackages = [ script ];
}
