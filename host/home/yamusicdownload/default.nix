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
		owner = "voronind-com";
		repo  = "yandex-music-downloader";
		rev   = "1d105ad022be480c1746e9351ec5837ac5f4d54d";
		hash  = "sha256-4X6tizUotL0e68vZg7hOQJf9SDQy2Drg8Hukwfvt/Ts=";
	};

	# NOTE: Waiting for PR https://github.com/llistochek/yandex-music-downloader/pull/49
	# src = pkgs.fetchFromGitHub {
	# 	owner = "llistochek";
	# 	repo  = "yandex-music-downloader";
	# 	rev   = "184d1d1aeb056d6b90df03437b2edde88661b19d";
	# 	hash  = "sha256-7ll1sMTE/fosgTRtaF6vHBsnDNiqxjFXaRG21JV7wo4=";
	# };
}
