{ lib, stdenv, fetchurl, ... }: let
	apks = {
		# https://github.com/bitwarden/mobile/releases
		Bitwarden = fetchurl {
			url    = "https://github.com/bitwarden/mobile/releases/download/v2024.5.1/com.x8bit.bitwarden-fdroid.apk";
			sha256 = "sha256-n4c5xEYvgd8Uhkqh3zSSyVA13ia+yqqGWA/DCATgOmU=";
		};

		# https://github.com/bitfireAT/davx5-ose/releases
		Davx5 = fetchurl {
			url    = "https://github.com/bitfireAT/davx5-ose/releases/download/v4.4.0.1-ose/davx5-ose-4.4.0.1-ose-release.apk";
			sha256 = "sha256-CBGWVBrxmxUSQ0Q7OEX8W6ZBfEW9AXQ90QyKfA+cENw=";
		};

		# https://github.com/patzly/grocy-android/releases
		Grocy = fetchurl {
			url    = "https://github.com/patzly/grocy-android/releases/download/v3.5.2/Grocy-Android-v3.5.2.apk";
			sha256 = "sha256-HyKoSl5po1Pl5keknlArruKXQHiSkNYfqKPMeBtvAN4=";
		};

		# https://github.com/jellyfin/jellyfin-android/releases
		Jellyfin = fetchurl {
			url    = "https://github.com/jellyfin/jellyfin-android/releases/download/v2.6.1/jellyfin-android-v2.6.1-libre-release.apk";
			sha256 = "sha256-Jyd/qM2vvtU7uogVla7ldpFqn2yRmq3ZKW/yHKpUafg=";
		};

		# https://github.com/nextcloud/android/releases
		NextCloud = fetchurl {
			url    = "https://github.com/nextcloud/android/releases/download/stable-3.29.0/nextcloud-30290090.apk";
			sha256 = "sha256-ArsGpXX7ClkBdOBJwQrxPVTr7fNNjZjTflvlAd5insw=";
		};

		# https://f-droid.org/packages/com.termux.nix
		NixOnDroid = fetchurl {
			url    = "https://f-droid.org/repo/com.termux.nix_188035.apk";
			sha256 = "sha256-sAuJejlDO5JY8+k1uql8ANug1l324lpxLg4w276pbEw=";
		};

		# https://github.com/ONLYOFFICE/documents-app-android/releases
		OnlyOffice = fetchurl {
			url    = "https://github.com/ONLYOFFICE/documents-app-android/releases/download/v8.0.1-533/onlyoffice-manager-8.0.1-533.apk";
			sha256 = "sha256-M2x5Vgaxcwuzc1QsIwhuIK9w7ANLcT3oOOJniWjCh3E=";
		};

		# https://download.wireguard.com/android-client
		Wireguard = fetchurl {
			url    = "https://download.wireguard.com/android-client/com.wireguard.android-1.0.20231018.apk";
			sha256 = "sha256-2NiCqtIO68j7X1FSc/c6xzTNaXUPRfbs2qt7/PVchP4=";
		};
	};
in stdenv.mkDerivation {
	name = "apks";
	dontUnpack = true;

	installPhase = "mkdir $out\n" + builtins.foldl' (acc: apk: acc + "${apk}\n") "" (
		lib.mapAttrsToList (name: path: "cp ${path} $out/${name}.apk") apks
	);
}
