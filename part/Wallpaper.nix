{ pkgs, ... }: let
	url    = "https://i.imgur.com/1RVKYxq.jpeg";
	sha256 = "sha256-9L2nlp2RpdIAKsoA9j1wgTF6WTkBYZCU0z7Rnn8pCvY=";

	# Sometimes stylix does not generate enough contrast for text.
	# This setting forces white text to ensure contrast on dark backgrounds.
	forceContrastText = false;
in {
	inherit forceContrastText;

	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
