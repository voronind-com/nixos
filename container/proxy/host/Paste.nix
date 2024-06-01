{ domain, util, container, ... }: let
	cfg = container.config.paste;
in {
	${cfg.domain} = container.mkServer {
		extraConfig = util.trimTabs ''
			listen 443 ssl;
			set $paste ${cfg.address}:80;

			location = / {
				return 403;
			}
			location / {
				proxy_pass http://$paste$request_uri;
			}

			ssl_certificate /etc/letsencrypt/live/${domain}/fullchain.pem;
			ssl_certificate_key /etc/letsencrypt/live/${domain}/privkey.pem;
			include /etc/letsencrypt/conf/options-ssl-nginx.conf;
			ssl_dhparam /etc/letsencrypt/conf/ssl-dhparams.pem;
		'';
	};
}
