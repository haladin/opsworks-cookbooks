default[:mongodb] = true
default[:document_root] = "/srv/www/autols_all"
default[:ssl_support] = false
default[:http_port] = 80
default[:port] = 8080
default[:ssl_port] = 443
default[:ssl_key_gen] = true
default[:ssl_certificate_path] = "/etc/nginx/ssl/nginx.crt"
default[:ssl_certificate_key_path] = "/etc/nginx/ssl/nginx.key"
default[:nodeJS_env] = "production"