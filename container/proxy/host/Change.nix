{ domain, util, container, ... }: let
	cfg = container.config.change;
in {
	${cfg.domain} = container.mkServer {
		extraConfig = util.trimTabs ''
			listen 443 ssl;
			set $change ${cfg.address}:5000;

			location / {
				allow 192.168.1.0/24;
				allow 10.1.0.1;
				deny all;
				proxy_pass http://$change$request_uri;
			}

			ssl_certificate /etc/letsencrypt/live/${domain}/fullchain.pem;
			ssl_certificate_key /etc/letsencrypt/live/${domain}/privkey.pem;
			include /etc/letsencrypt/conf/options-ssl-nginx.conf;
			ssl_dhparam /etc/letsencrypt/conf/ssl-dhparams.pem;
		'';
	};
}
