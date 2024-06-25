{ pkgs, lib, config, ... }: with lib; let
	cfg = config.module.amd.cpu;

	controlFile = "/sys/devices/system/cpu/cpufreq/boost";
	enableCmd   = "0";
	disableCmd  = "1";
in {
	options = {
		module.amd.cpu = {
			enable = mkEnableOption "Enable AMD Cpu support.";
			powersave.enable = mkEnableOption "Enable AMD Cpu powersave." // { default = true; };
		};
	};

	config = mkIf cfg.enable (mkMerge [
		{
			boot.kernelModules = [ "kvm-amd" ];
			hardware.cpu.amd.updateMicrocode = mkDefault config.hardware.enableRedistributableFirmware;
		}
		(mkIf cfg.powersave.enable {
			module.powersave = {
				enable = true;
				cpu.boost = { inherit controlFile enableCmd disableCmd; };
			};
		})
	]);
}
