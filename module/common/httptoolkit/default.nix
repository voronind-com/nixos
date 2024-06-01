# Apple San Francisco and New York fonts.
# They are not available in Nixpkgs repo, so this script
# downloads the fonts from Apple website and adds them to Nix store.
{ lib, stdenv, fetchurl, pkgs }: stdenv.mkDerivation {
	pname   = "httptoolkit";
	version = "1.15.0";

	src = fetchurl {
		url  = "https://github.com/httptoolkit/httptoolkit-desktop/releases/download/v1.15.0/HttpToolkit-linux-x64-1.15.0.zip";
		hash = "sha256-wb4is5IX1/Sjea4tggFP48snAx7+Bp4ux+306xFBMtM=";
	};

	nativeBuildInputs = with pkgs; [
		autoPatchelfHook
		unzip
	];

	sourceRoot = ".";

	buildInputs = with pkgs; [
		alsa-lib
		atk
		cairo
		cups
		dbus
		expat
		glib
		gtk3
		libGL
		libxkbcommon
		mesa
		nss
		pango
		playwright
		xorg.libXcomposite
		xorg.libXrandr
		xorg.libxcb
	];

	preBuild = ''
		addAutoPatchelfSearchPath .
	'';

	installPhase = ''
		runHook preInstall
		mkdir -p $out/bin
		cp -r * $out/bin
		install -m755 -D httptoolkit $out/bin
		runHook postInstall
	'';

	meta = with lib; {
		homapage = "https://github.com/httptoolkit/httptoolkit-desktop";
		platform = platforms.linux;
	};
}
