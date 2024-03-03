{ environment, ... }: {
	users.mutableUsers = false;
	environment.etc."user-dirs.dirs".text = ''
		XDG_DESKTOP_DIR="$HOME/"
		XDG_DOWNLOAD_DIR="$HOME/download"
		XDG_TEMPLATES_DIR="$HOME/document/template"
		XDG_PUBLICSHARE_DIR="$HOME/"
		XDG_DOCUMENTS_DIR="$HOME/document"
		XDG_MUSIC_DIR="$HOME/"
		XDG_PICTURES_DIR="$HOME/media/picture"
		XDG_VIDEOS_DIR="$HOME/media/video"
	'';
}
