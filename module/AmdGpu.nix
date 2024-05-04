# AMD GPU specific configuration.
# No, I do not own any Nvidia/Intel GPUs, so I have no configuration for them.
{ nixpkgs, pkgs, ... }: {
	boot.initrd.kernelModules     = [ "amdgpu" ];
	services.xserver.videoDrivers = [ "amdgpu" ];
	hardware.opengl.driSupport      = true;
	hardware.opengl.driSupport32Bit = true;
	environment.variables.AMD_VULKAN_ICD = "RADV";

	# AMDVLK was broken for me (huge stuttering). So keep it disabled, at least for now.
	# hardware.opengl.extraPackages = with pkgs; [
	# 	amdvlk
	# ];
	# hardware.opengl.extraPackages32 = with pkgs; [
	# 	driversi686Linux.amdvlk
	# ];
}
