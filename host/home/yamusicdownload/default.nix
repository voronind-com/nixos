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
		rev   = "8266917793d17fd9dd020154bb5aabc44f88b129";
		hash  = "sha256-lhEdeN9Vl4wcptWbF/fNfD3KqAdShs6MLYfJK5IDdXE=";
	};

	# NOTE: Waiting for PR https://github.com/llistochek/yandex-music-downloader/pull/49
	# src = pkgs.fetchFromGitHub {
	# 	owner = "llistochek";
	# 	repo  = "yandex-music-downloader";
	# 	rev   = "";
	# 	hash  = "";
	# };
}
