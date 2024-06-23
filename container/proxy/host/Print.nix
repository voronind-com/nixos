{ domain, util, container, ... }: let
	cfg  = container.config.print;
	name = "print";
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

				proxy_set_header Host "127.0.0.1";
				proxy_set_header X-Real-IP $remote_addr;
				proxy_set_header X-Forward-For $proxy_add_x_forwarded_for;
			}

			ssl_certificate /etc/letsencrypt/live/${domain}/fullchain.pem;
			ssl_certificate_key /etc/letsencrypt/live/${domain}/privkey.pem;
			include /etc/letsencrypt/conf/options-ssl-nginx.conf;
			ssl_dhparam /etc/letsencrypt/conf/ssl-dhparams.pem;
		'';
	};
}
