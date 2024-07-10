{ util, config, container, ... }: let
	domain  = config.container.domain;
	address = "10.1.0.29";
in {
	"fmp-cloud.${domain}" = container.mkServer {
		extraConfig = util.trimTabs ''
			listen 443 ssl;
			set $fmpnextcloud ${address}:80;

			location ~ ^/(settings/admin|settings/users|settings/apps|api) {
				allow ${config.container.localAccess};
				allow ${config.container.module.vpn.address};
				deny all;
				proxy_pass http://$fmpnextcloud$request_uri;
			}

			location / {
				proxy_pass http://$fmpnextcloud$request_uri;
			}

			ssl_certificate /etc/letsencrypt/live/${config.container.domain}/fullchain.pem;
			ssl_certificate_key /etc/letsencrypt/live/${config.container.domain}/privkey.pem;
			include /etc/letsencrypt/conf/options-ssl-nginx.conf;
			ssl_dhparam /etc/letsencrypt/conf/ssl-dhparams.pem;
		'';
	};

	"fmp-git.${domain}" = container.mkServer {
		extraConfig = util.trimTabs ''
			listen 443 ssl;
			set $fmpgitea ${address}:3000;

			location ~ ^/(admin|api) {
				allow ${config.container.localAccess};
				allow ${config.container.module.vpn.address};
				deny all;
				proxy_pass http://$fmpgitea$request_uri;
			}

			location / {
				proxy_pass http://$fmpgitea$request_uri;
			}

			ssl_certificate /etc/letsencrypt/live/${config.container.domain}/fullchain.pem;
			ssl_certificate_key /etc/letsencrypt/live/${config.container.domain}/privkey.pem;
			include /etc/letsencrypt/conf/options-ssl-nginx.conf;
			ssl_dhparam /etc/letsencrypt/conf/ssl-dhparams.pem;
		'';
	};

	"fmp-dev.${domain}" = container.mkServer {
		extraConfig = util.trimTabs ''
			listen 443 ssl;
			set $fmpdev ${config.container.host}:8079;

			location / {
				proxy_pass http://$fmpdev$request_uri;
				add_header Referrer-Policy 'origin';
			}

			ssl_certificate /etc/letsencrypt/live/${config.container.domain}/fullchain.pem;
			ssl_certificate_key /etc/letsencrypt/live/${config.container.domain}/privkey.pem;
			include /etc/letsencrypt/conf/options-ssl-nginx.conf;
			ssl_dhparam /etc/letsencrypt/conf/ssl-dhparams.pem;
		'';
	};

	"fmp-master.${domain}" = container.mkServer {
		extraConfig = util.trimTabs ''
			listen 443 ssl;
			set $fmpmaster ${config.container.host}:8081;

			location / {
				proxy_pass http://$fmpmaster$request_uri;
				add_header Referrer-Policy 'origin';
			}

			ssl_certificate /etc/letsencrypt/live/${config.container.domain}/fullchain.pem;
			ssl_certificate_key /etc/letsencrypt/live/${config.container.domain}/privkey.pem;
			include /etc/letsencrypt/conf/options-ssl-nginx.conf;
			ssl_dhparam /etc/letsencrypt/conf/ssl-dhparams.pem;
		'';
	};
}
