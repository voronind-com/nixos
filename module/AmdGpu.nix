{ nixpkgs, pkgs, ... }: {
	boot.initrd.kernelModules     = [ "amdgpu" ];
	services.xserver.videoDrivers = [ "amdgpu" ];
	hardware.opengl.driSupport      = true;
	hardware.opengl.driSupport32Bit = true;
	environment.variables.AMD_VULKAN_ICD = "RADV";

	# Compute.
	nixpkgs.config.rocmSupport = true;
	systemd.tmpfiles.rules = [
		"L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
	];
	hardware.opengl.extraPackages = with pkgs; [
		rocmPackages.clr.icd
	];

	# AMDVLK was broken for me (huge stuttering). So keep it disabled, at least for now.
	# hardware.opengl.extraPackages = with pkgs; [
	# 	amdvlk
	# ];
	# hardware.opengl.extraPackages32 = with pkgs; [
	# 	driversi686Linux.amdvlk
	# ];
}
