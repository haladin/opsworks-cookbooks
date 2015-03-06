template "/etc/nginx/sites-available/default" do
  source "default-site.erb"
  owner "root"
  group "root"
  mode 0644
end

if node[:ssl_support]
	Chef::Log.info("Installing local mongoDB ....")
	Chef::Log.info(`sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt`)	
end

service "nginx" do
  supports :status => true
  action :restart
end