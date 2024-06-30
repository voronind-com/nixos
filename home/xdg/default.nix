{ homeDirectory, ... }: {
	userDirs = {
		enable = true;
		createDirectories = true;
		desktop     = "${homeDirectory}/";
		documents   = "${homeDirectory}/document/";
		download    = "${homeDirectory}/download/";
		music       = "${homeDirectory}/media/music/";
		pictures    = "${homeDirectory}/media/picture/";
		publicShare = "${homeDirectory}/media/share/";
		templates   = "${homeDirectory}/media/template/";
		videos      = "${homeDirectory}/media/video/";
		extraConfig = {
			XDG_TMP_DIR = "${homeDirectory}/tmp/";
		};
	};
}
