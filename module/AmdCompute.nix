# AMD Rocm support (for Blender).
{ nixpkgs, pkgs, ... }: {
	nixpkgs.config.rocmSupport = true;
	systemd.tmpfiles.rules = [
		"L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
	];
	hardware.opengl.extraPackages = with pkgs; [
		rocmPackages.clr.icd
	];
}
