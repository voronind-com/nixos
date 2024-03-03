{ pkgs, ... }: {
	fonts.packages = with pkgs; [
		(pkgs.callPackage ./applefont {})
		(nerdfonts.override { fonts = [ "Terminus" ]; })
	];
}
