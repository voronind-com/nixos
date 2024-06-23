{ pkgs, setting, ... }: {
	file = (pkgs.formats.toml {}).generate "YaziYaziConfig" {
		manager = {
			# linemode       = "mtime";
			mouse_events   = [];
			ratio          = [ 1 4 3 ];
			scrolloff      = 1;
			show_hidden    = false;
			show_symlink   = true;
			sort_by        = "natural";
			sort_dir_first = true;
			sort_sensitive = true;
			sort_translit  = true;
		};

		preview = {
			# image_filter  = "triangle";
			image_filter  = "lanczos3";
			image_quality = 80;
		};

		opener = let
			openWith = app: "${app} \"$@\"";
		in {
			default = [{
				desc   = "Default";
				orphan = true;
				run    = openWith "xdg-open";
			}];
			browser = [{
				desc   = "Browser";
				orphan = true;
				run    = openWith setting.browser.bin;
			}];
			text = [{
				desc  = "Text";
				block = true;
				run   = openWith "nvim";
			}];
			audio = [{
				desc   = "Audio";
				orphan = true;
				run    = openWith "mpv --no-video";
			}];
			video = [{
				desc   = "Video";
				orphan = true;
				run    = openWith "mpv";
			}];
			document = [{
				desc   = "Document";
				orphan = true;
				run    = openWith "onlyoffice-desktopeditors";
			}];
			pdf = [{
				desc   = "Pdf";
				orphan = true;
				run    = openWith "evince";
			}];
			image = [{
				desc   = "Image";
				orphan = true;
				run    = openWith "loupe";
			}];
			archive = [{
				desc  = "Archive";
				block = true;
				run   = openWith "unpack";
			}];
		};

		open = {
			rules = let
				mkRule = mime: use: { inherit mime use; };
			in [
				(mkRule "application/gzip"  "archive")
				(mkRule "application/json"  "text")
				(mkRule "application/pdf"   "pdf")
				(mkRule "application/x-tar" "archive")
				(mkRule "application/x-xz"  "archive")
				(mkRule "application/zip"   "archive")
				(mkRule "audio/*" "audio")
				(mkRule "image/*" "image")
				(mkRule "text/*"  "text")
				(mkRule "video/*" "video")
				(mkRule "text/html" [ "browser" "text" ])
				(mkRule "application/vnd.openxmlformats-officedocument.*" "document")
			];
		};
	};
}
