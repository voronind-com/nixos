{ domain, util, container, ... }: let
	cfg = container.config.cloud;
in {
	${cfg.domain} = container.mkServer {
		extraConfig = util.trimTabs ''
			listen 443 ssl;
			set $cloud ${cfg.address}:80;

			location ~ ^/(settings/admin|settings/users|settings/apps|login|api) {
				allow 192.168.1.0/24;
				allow 10.1.0.1;
				deny all;
				proxy_pass http://$cloud$request_uri;
			}
			location / {
				proxy_pass http://$cloud$request_uri;
			}

			ssl_certificate /etc/letsencrypt/live/${domain}/fullchain.pem;
			ssl_certificate_key /etc/letsencrypt/live/${domain}/privkey.pem;
			include /etc/letsencrypt/conf/options-ssl-nginx.conf;
			ssl_dhparam /etc/letsencrypt/conf/ssl-dhparams.pem;
		'';
	};
}

