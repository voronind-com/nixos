{ util, container, config, ... }: let
	cfg  = config.container.module.office;
	name = "office";
in {
	${cfg.domain} = container.mkServer {
		extraConfig = util.trimTabs ''
			listen 443 ssl;
			set ''$${name} ${cfg.address}:${toString cfg.port};

			location / {
				# allow ${config.container.localAccess};
				# allow ${config.container.module.status.address};
				# allow ${config.container.module.vpn.address};
				# deny all;
				add_header X-Forwarded-Proto https;
				proxy_pass http://''$${name}$request_uri;
			}

			ssl_certificate /etc/letsencrypt/live/${config.container.domain}/fullchain.pem;
			ssl_certificate_key /etc/letsencrypt/live/${config.container.domain}/privkey.pem;
			include /etc/letsencrypt/conf/options-ssl-nginx.conf;
			ssl_dhparam /etc/letsencrypt/conf/ssl-dhparams.pem;
		'';
	};
}
