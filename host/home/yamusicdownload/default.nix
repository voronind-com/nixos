{ pkgs, ... }: with pkgs.python3Packages; buildPythonPackage {
	version = "1.0.0";
	pname   = "yandex-music-downloader";
	format  = "pyproject";

	propagatedBuildInputs = [
		setuptools
		setuptools-git
		requests
		eyed3
		browser-cookie3
	];

	src = pkgs.fetchFromGitHub {
		owner = "llistochek";
		repo  = "yandex-music-downloader";
		rev   = "184d1d1aeb056d6b90df03437b2edde88661b19d";
		hash  = "sha256-7ll1sMTE/fosgTRtaF6vHBsnDNiqxjFXaRG21JV7wo4=";
	};
}
