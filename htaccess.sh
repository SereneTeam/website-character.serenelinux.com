echo 'Header always append X-Frame-Options DENY
Header always set X-XSS-Protection "1; mode=block"
Header always set X-Content-Type-Options "nosniff"
Header set Strict-Transport-Security "max-age=315360000; includeSubDomains; preload"


<ifModule mod_deflate.c>
<IfModule mod_filter.c>
AddOutputFilterByType DEFLATE text/html text/xml text/css text/plain
AddOutputFilterByType DEFLATE image/svg+xml application/xhtml+xml application/xml
AddOutputFilterByType DEFLATE application/rdf+xml application/rss+xml application/atom+xml
AddOutputFilterByType DEFLATE text/javascript application/javascript application/x-javascript application/json
AddOutputFilterByType DEFLATE application/x-httpd-php application/x-httpd-fastphp
AddOutputFilterByType DEFLATE application/x-font-ttf application/x-font-otf
AddOutputFilterByType DEFLATE font/truetype font/opentype
</IfModule>
</ifModule>
AddType text/cache-manifest .appcache
AddType image/x-icon .ico
AddType image/svg+xml .svg
AddType application/x-font-ttf .ttf
AddType application/x-font-woff .woff
AddType application/x-font-woff2 .woff2
AddType application/x-font-opentype .otf
AddType application/vnd.ms-fontobject .eot
<IfModule mod_expires.c>
    ExpiresActive on
    ExpiresDefault                                      "access plus 1 month"
    ExpiresByType text/css                              "access plus 1 year"
    ExpiresByType application/atom+xml                  "access plus 1 hour"
    ExpiresByType application/rdf+xml                   "access plus 1 hour"
    ExpiresByType application/rss+xml                   "access plus 1 hour"
    ExpiresByType application/json                      "access plus 0 seconds"
    ExpiresByType application/ld+json                   "access plus 0 seconds"
    ExpiresByType application/schema+json               "access plus 0 seconds"
    ExpiresByType application/vnd.geo+json              "access plus 0 seconds"
    ExpiresByType application/xml                       "access plus 0 seconds"
    ExpiresByType text/xml                              "access plus 0 seconds"
    ExpiresByType image/vnd.microsoft.icon              "access plus 1 week"
    ExpiresByType image/x-icon                          "access plus 1 week"
    ExpiresByType text/html                             "access plus 0 seconds"
    ExpiresByType application/javascript                "access plus 1 year"
    ExpiresByType application/x-javascript              "access plus 1 year"
    ExpiresByType text/javascript                       "access plus 1 year"
    ExpiresByType application/manifest+json             "access plus 1 week"
    ExpiresByType application/x-web-app-manifest+json   "access plus 0 seconds"
    ExpiresByType text/cache-manifest                   "access plus 0 seconds"
    ExpiresByType audio/ogg                             "access plus 1 month"
    ExpiresByType image/bmp                             "access plus 1 month"
    ExpiresByType image/gif                             "access plus 1 month"
    ExpiresByType image/jpeg                            "access plus 1 month"
    ExpiresByType image/png                             "access plus 1 month"
    ExpiresByType image/svg+xml                         "access plus 1 month"
    ExpiresByType image/webp                            "access plus 1 month"
    ExpiresByType video/mp4                             "access plus 1 month"
    ExpiresByType video/ogg                             "access plus 1 month"
    ExpiresByType video/webm                            "access plus 1 month"
    ExpiresByType application/vnd.ms-fontobject         "access plus 1 month"
    ExpiresByType font/eot                              "access plus 1 month"
    ExpiresByType font/opentype                         "access plus 1 month"
    ExpiresByType application/x-font-ttf                "access plus 1 month"
    ExpiresByType application/font-woff                 "access plus 1 month"
    ExpiresByType application/x-font-woff               "access plus 1 month"
    ExpiresByType font/woff                             "access plus 1 month"
    ExpiresByType application/font-woff2                "access plus 1 month"
    ExpiresByType text/x-cross-domain-policy            "access plus 1 week"

</IfModule>

RewriteEngine on
RewriteRule ^ja/(.*)$ https://%{HTTP_HOST}/$1 [R=301,L]
RewriteCond %{HTTPS} !=on [NC]
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]

ErrorDocument 400 /error/400.html
ErrorDocument 401 /error/401.html
ErrorDocument 403 /error/403.html
ErrorDocument 404 /error/404.html
ErrorDocument 500 /error/500.html
ErrorDocument 501 /error/501.html
ErrorDocument 502 /error/502.html
ErrorDocument 503 /error/503.html' > /virtual/art/public_html/linux.bex.jp/.htaccess
echo "Order allow,deny" >> /virtual/art/public_html/linux.bex.jp/.htaccess
curl https://check.torproject.org/exit-addresses | awk 'match($0,/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/) {print "deny from "$2}' >> /virtual/art/public_html/linux.bex.jp/.htaccess

