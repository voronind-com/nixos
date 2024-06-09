{ domain, util, container, ... }: let
	cfg  = container.config.git;
	name = "git";
in {
	${cfg.domain} = container.mkServer {
		extraConfig = util.trimTabs ''
			listen 443 ssl;
			set ''$${name} ${cfg.address}:${toString cfg.port};

			location ~ ^/(admin|api|user) {
				allow ${container.localAccess};
				allow ${container.config.vpn.address};
				deny all;
				proxy_pass http://''$${name}$request_uri;
			}

			location /markdown {
				allow ${container.localAccess};
				allow ${container.config.vpn.address};
				deny all;

				proxy_set_header Content-Type "application/json";
				proxy_set_header Authorization "Basic dm9yb25pbmQ6QUxwWHZoRlRNYmpIazY3OVBkZDhCTjZNS0hyWjZ4aGU=";

				proxy_pass_header Content-Type;
				proxy_pass_header Authorization;

				proxy_pass http://''$${name}/api/v1/markdown/raw;
			}

			location / {
				# allow ${container.localAccess};
				# allow ${container.config.vpn.address};
				# deny all;
				proxy_pass http://''$${name}$request_uri;
			}

			ssl_certificate /etc/letsencrypt/live/${domain}/fullchain.pem;
			ssl_certificate_key /etc/letsencrypt/live/${domain}/privkey.pem;
			include /etc/letsencrypt/conf/options-ssl-nginx.conf;
			ssl_dhparam /etc/letsencrypt/conf/ssl-dhparams.pem;
		'';
	};
}
