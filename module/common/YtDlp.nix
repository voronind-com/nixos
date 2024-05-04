{ pkgs, ... }: {
	# Instead of overlaying and rebuilding YtDlp I download the release from
	# GitHub and patch it for Nix.
	environment.systemPackages = with pkgs; [
		(pkgs.callPackage ./ytdlp {})
	];
}
