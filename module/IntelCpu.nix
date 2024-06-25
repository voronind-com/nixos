# Intel CPU specific configuration.
{ pkgs, lib, config, ... }: with lib; let
	cfg = config.module.intel.cpu;

	controlFile = "/sys/devices/system/cpu/intel_pstate/no_turbo";
	enableCmd  = "1";
	disableCmd = "0";
in {
	options = {
		module.intel.cpu = {
			enable = mkEnableOption "Support for Shintel CPUs";
			powersave.enable = mkEnableOption "Enable Shintel Cpu powersave." // { default = true; };
		};
	};

	config = mkIf cfg.enable (mkMerge [
		{
			boot.kernelModules = [ "kvm-intel" ];
		}
		(mkIf cfg.powersave.enable {
			module.powersave = {
				enable = true;
				cpu.boost = { inherit controlFile enableCmd disableCmd; };
			};
		})
	]);
}
