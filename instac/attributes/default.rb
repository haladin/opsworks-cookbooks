default[:application_name] = "autols_all"
default[:mongodb] = true
default[:document_root] = "/srv/www/autols_all"
default[:ssl_support] = false
default[:http_support] = true
default[:http_port] = 80
default[:port] = 8080
default[:push_port] = 41414
default[:ssl_port] = 443
default[:ssl_key_gen] = true
default[:ssl_certificate_path] = "/etc/nginx/ssl"
default[:ssl_certificate_key_name] = "nginx.key"
default[:ssl_certificate_name] = "nginx.crt"
default[:ssl_certificate_subj] = "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com"
default[:nodeJS_env] = "production"