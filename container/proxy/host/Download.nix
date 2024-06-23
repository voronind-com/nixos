{ domain, util, container, ... }: let
	cfg  = container.config.download;
	name = "download";
in {
	${cfg.domain} = container.mkServer {
		extraConfig = util.trimTabs ''
			listen 443 ssl;
			set ''$${name} ${cfg.address}:${toString cfg.port};

			location / {
				allow ${container.localAccess};
				allow ${container.config.status.address};
				allow ${container.config.vpn.address};
				deny all;
				proxy_pass http://''$${name}$request_uri;
			}

			ssl_certificate /etc/letsencrypt/live/${domain}/fullchain.pem;
			ssl_certificate_key /etc/letsencrypt/live/${domain}/privkey.pem;
			include /etc/letsencrypt/conf/options-ssl-nginx.conf;
			ssl_dhparam /etc/letsencrypt/conf/ssl-dhparams.pem;
		'';
	};
}
