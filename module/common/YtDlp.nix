{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		(pkgs.callPackage ./ytdlp {})
	];
}
