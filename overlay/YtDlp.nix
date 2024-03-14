{ ... }: {
	nixpkgs.overlays = [ (final: prev: {
		yt-dlp = prev.yt-dlp.overrideAttrs (old: {
			src = prev.fetchFromGitHub {
				owner = "yt-dlp";
				repo  = "yt-dlp";
				rev   = "2024.03.10";
				hash  = "sha256-A6uciGErM4QgLrY5jMFGlPV2uH9O2cOhj5+IapyjVo0 = ";
			};
		});
	})];
}
