template "/etc/nginx/sites-enabled/default" do
  source "nginx_default.erb"
  owner "root"
  group "root"
  mode 0644
end

if node[:ssl_support] and node[:ssl_key_gen]
	Chef::Log.info("Creating new certificates....")
	Chef::Log.info(`sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout #{node[:ssl_certificate_key_path]} -out #{node[:ssl_certificate_path]}`)	
end

service "nginx" do
  supports :status => true
  action :restart
end