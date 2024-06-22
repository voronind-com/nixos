{ pkgs, setting, ... }: {
	file = (pkgs.formats.toml {}).generate "YaziYaziConfig" {
		manager = {
			linemode       = "mtime";
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

		# preview = {
		# 	# image_filter = "triangle";
		# 	image_filter = "lanczos3";
		# 	image_quality = 80;
		# };

		opener = let
			openWith = app: "${app} \"$@\"";
		in {
			default = [{
				orphan = true;
				run   = openWith "xdg-open";
			}];
			browser = [{
				orphan = true;
				run    = openWith setting.browser;
			}];
			text = [{
				block = true;
				run   = openWith "nvim";
			}];
			audio = [{
				orphan = true;
				run    = openWith "mpv --no-video";
			}];
			video = [{
				orphan = true;
				run    = openWith "mpv";
			}];
			document = [{
				orphan = true;
				run   = openWith "onlyoffice";
			}];
			pdf = [{
				orphan = true;
				run   = openWith "evince";
			}];
			image = [{
				orphan = true;
				run   = openWith "loupe";
			}];
		};

		open = {
			rules = [
				{
					mime = "application/pdf";
					use  = "pdf";
				} {
					mime = "text/*";
					use  = "text";
				} {
					mime = "application/vnd.openxmlformats-officedocument.*";
					use  = "document";
				} {
					mime = "image/*";
					use  = "image";
				} {
					mime = "video/*";
					use  = "video";
				} {
					mime = "audio/*";
					use  = "audio";
				} {
					name = "*.json";
					use  = "text";
				} {
					name = "*.html";
					use  = [ "browser" "text" ];
				}
			];
		};
	};
}
