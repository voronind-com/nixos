{ pkgs, container, ... }: let
	iconTheme = "fa-solid";

	mkGroup = name: icon: items: {
		inherit name items;
		icon = "${iconTheme} ${icon}";
	};

	mkLink = name: icon: url: {
		inherit name url;
		icon   = "${iconTheme} ${icon}";
		target = "_blank";
	};

	config = {
		title    = "Dashboard";
		subtitle = "Home";
		header = false;
		footer = false;
		connectivityCheck = false;

		theme = "default";
		colors = let
			colors = {
				background          = "#1b1b1b";
				card-background     = "#2b2b2b";
				card-shadow         = "#2b2b2b";
				highlight-hover     = "#003006";
				highlight-primary   = "#004016";
				highlight-secondary = "#004016";
				link                = "#666666";
				link-hover          = "#ffdd57";
				text                = "#eaeaea";
				text-header         = "#ffffff";
				text-subtitle       = "#f5f5f5";
				text-title          = "#fafafa";
			};
		in {
			light = colors;
			dark  = colors;
		};

		links = [
			(mkLink "Status" "fa-heartbeat" "https://status.voronind.com")
		];

		services = [
			(mkGroup "App" "fa-server" [
				(mkLink "Change"   "fa-user-secret"   "https://${container.config.change.domain}")
				(mkLink "Cloud"    "fa-cloud"         "https://${container.config.cloud.domain}")
				(mkLink "Download" "fa-download"      "https://${container.config.download.domain}")
				(mkLink "Git"      "fab fa-git-alt"   "https://${container.config.download.domain}")
				(mkLink "Iot"      "fa-home"          "https://${container.config.iot.domain}")
				(mkLink "Mail"     "fa-envelope"      "https://${container.config.mail.domain}")
				(mkLink "Paper"    "fa-paperclip"     "https://${container.config.paper.domain}")
				(mkLink "Pass"     "fa-key"           "https://${container.config.pass.domain}")
				(mkLink "Paste"    "fa-paste"         "https://${container.config.paste.domain}/s")
				(mkLink "Print"    "fa-print"         "https://${container.config.print.domain}")
				(mkLink "Read"     "fa-book"          "https://${container.config.read.domain}")
				(mkLink "Search"   "fa-search"        "https://${container.config.search.domain}")
				(mkLink "Stock"    "fa-boxes-stacked" "https://${container.config.stock.domain}")
				# (mkLink "Tool"     "fa-toolbox"       "https://${container.config.tool.domain}")
				(mkLink "Watch"    "fa-film"          "https://${container.config.watch.domain}")
				(mkLink "YouTube"  "fab fa-youtube"   "https://${container.config.yt.domain}")
			])
			(mkGroup "System" "fa-shield" [
				(mkLink "Camera"       "fa-camera"      "https://${container.config.camera.domain}")
				# (mkLink "Hdd"          "fa-hard-drive" "https://${container.config.hdd.domain}")
				(mkLink "NixOS Search" "fa-snowflake"  "https://search.nixos.org")
				(mkLink "Printer"      "fa-print"      "https://${container.config.printer.domain}")
				(mkLink "Router"       "fa-route"      "https://${container.config.router.domain}")
			])
			(mkGroup "Bookmark" "fa-bookmark" [
				(mkLink "2gis"        "fa-map-location-dot" "https://2gis.ru")
				(mkLink "FontAwesome" "fa-font-awesome"     "https://fontawesome.com/search?o=r&m=free")
				(mkLink "MonkeyType"  "fa-keyboard"         "https://monkeytype.com")
				(mkLink "NerdFonts"   "fa-font"             "https://www.nerdfonts.com/cheat-sheet")
				(mkLink "Reddit"      "fab fa-reddit"       "https://reddit.com")
				(mkLink "Zigbee"      "fa-satellite-dish"   "https://zigbee.blakadder.com")
			])
			(mkGroup "Work" "fa-briefcase" [
				(mkLink "Vm Manager" "fa-server" "https://fs-vcsa.fs.fsight.world/ui")
			])
			(mkGroup "Pirate" "fa-skull-crossbones" [
				(mkLink "1337x"        "fa-skull-crossbones" "https://1337x.to")
				(mkLink "Cs.rin.ru"    "fa-skull-crossbones" "https://cs.rin.ru/forum/index.php")
				(mkLink "DigitalCore"  "fa-skull-crossbones" "https://digitalcore.club")
				(mkLink "FitGirl"      "fa-skull-crossbones" "https://fitgirl-repacks.site")
				(mkLink "Hf"           "fa-skull-crossbones" "https://happyfappy.org")
				(mkLink "Lst"          "fa-skull-crossbones" "https://lst.gg")
				(mkLink "NnmClub"      "fa-skull-crossbones" "https://nnmclub.to")
				(mkLink "Rutor"        "fa-skull-crossbones" "https://rutor.info")
				(mkLink "Rutracker"    "fa-skull-crossbones" "https://rutracker.org")
				(mkLink "Tapochek.net" "fa-skull-crossbones" "https://tapochek.net/index.php")
			])
		];
	};
in {
	text = (pkgs.formats.yaml {}).generate "HomerConfig" config;
}
