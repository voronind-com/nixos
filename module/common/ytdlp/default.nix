{ lib, stdenv, fetchurl, autoPatchelfHook }: let
	version = "2024.03.10";
	hash    = "sha256-sYhSMRngpDaPU+Ea0PIjx+1EqKKGY+S2wgUSLaA39Hs=";
in stdenv.mkDerivation {
	name = "ytdlp";

	dontUnpack = true;

	src = fetchurl {
		url    = "https://github.com/yt-dlp/yt-dlp/releases/download/${version}/yt-dlp_linux";
		sha256 = "${hash}";
	};

	nativeBuildInputs = [ autoPatchelfHook ];

	installPhase = ''
		mkdir -p $out/bin
		cp $src $out/bin/yt-dlp
		chmod +x $out/bin/yt-dlp
	'';

	meta = with lib; {
		description    = "Youtube Downloader.";
		homepage       = "https://github.com/yt-dlp/yt-dlp";
		license        = licenses.unlicense;
		meta.platforms = platforms.all;
	};
}
