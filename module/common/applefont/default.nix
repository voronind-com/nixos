# Apple San Francisco and New York fonts.
# They are not available in Nixpkgs repo, so this script
# downloads the fonts from Apple website and adds them to Nix store.
{ lib, stdenv, fetchurl, p7zip }: let
	pro = fetchurl {
		url    = "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg";
		sha256 = "sha256-Mu0pmx3OWiKBmMEYLNg+u2MxFERK07BQGe3WAhEec5Q=";
	};

	compact = fetchurl {
		url    = "https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg";
		sha256 = "sha256-Mkf+GK4iuUhZdUdzMW0VUOmXcXcISejhMeZVm0uaRwY=";
	};

	mono = fetchurl {
		url    = "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg";
		sha256 = "sha256-tZHV6g427zqYzrNf3wCwiCh5Vjo8PAai9uEvayYPsjM=";
	};

	ny = fetchurl {
		url    = "https://devimages-cdn.apple.com/design/resources/download/NY.dmg";
		sha256 = "sha256-tn1QLCSjgo5q4PwE/we80pJavr3nHVgFWrZ8cp29qBk=";
	};
in stdenv.mkDerivation {
	name = "applefont";

	dontUnpack = true;

	nativeBuildInputs = [ p7zip ];

	installPhase = let
		unpackFont = dmg: dir: pkg: ''
			7z x '${dmg}'
			pushd '${dir}'
			7z x '${pkg}'
			7z x 'Payload~'
			cp Library/Fonts/* $TMPDIR
			popd
		'';
	in ''
		${unpackFont pro     "SFProFonts"     "SF Pro Fonts.pkg"}
		${unpackFont mono    "SFMonoFonts"    "SF Mono Fonts.pkg"}
		${unpackFont compact "SFCompactFonts" "SF Compact Fonts.pkg"}
		${unpackFont ny      "NYFonts"        "NY Fonts.pkg"}

		mkdir -p $out/usr/share/fonts/{TTF,OTF}
		mv $TMPDIR/*.otf $out/usr/share/fonts/OTF
		mv $TMPDIR/*.ttf $out/usr/share/fonts/TTF
	'';

	meta = with lib; {
		description    = "Apple San Francisco, New York fonts.";
		homepage       = "https://developer.apple.com/fonts";
		license        = licenses.unfree;
		meta.platforms = platforms.all;
	};
}
