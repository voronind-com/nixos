{ domain, util, container, ... }: let
	cfg = container.config.camera;
in {
	${cfg.domain} = container.mkServer {
		extraConfig = util.trimTabs ''
			listen 443 ssl;

			location / {
				allow ${container.localAccess};
				allow ${container.config.vpn.address};
				deny all;
				return 301 rtsp://${cfg.address}:${cfg.port}/live/main;
			}

			ssl_certificate /etc/letsencrypt/live/${domain}/fullchain.pem;
			ssl_certificate_key /etc/letsencrypt/live/${domain}/privkey.pem;
			include /etc/letsencrypt/conf/options-ssl-nginx.conf;
			ssl_dhparam /etc/letsencrypt/conf/ssl-dhparams.pem;
		'';
	};
}
