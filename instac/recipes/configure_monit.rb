Chef::Log.info("Creating monitrc config file for push server ....")

template "/etc/monit/conf.d/autols_all-push-server.monitrc" do
	source 'autols_all-push-server.monitrc.erb'
	owner 'root'
	group 'root'
	mode '0644'
	variables(
	  :dest_path => "#{node[:document_root]}",
	  :nodeJS_env => "#{node[:nodeJS_env]}"
	)	
end

Chef::Log.info("Creating monitrc config file for REST server ....")

template "/etc/monit/conf.d/node_web_app-autols_all.monitrc" do
	source 'node.monitrc.erb'
	cookbook 'instac'
	owner 'root'
	group 'root'
	mode '0644'
	variables(
	  :dest_path => "#{node[:document_root]}",
	  :monitored_script => "#{node[:document_root]}/current/dist/server/app.js",
	  :ssl_support => "#{node[:ssl_support]}",
	  :ssl_port => "#{node[:ssl_port]}",
	  :port => "#{node[:port]}",
	  :nodeJS_env => "#{node[:nodeJS_env]}"
	)	
end

ruby_block "Reloading monit configuration" do
  block do
    Chef::Log.info(`sudo monit reload`)
    raise "Fail to reloading monit configuration" unless $?.success?
  end
end

ruby_block "Restarting REST server ...." do
  block do
    Chef::Log.info(`sudo monit restart node_web_app_autols_all`)
  end
end

ruby_block "Restarting PUSH server ...." do
  block do
    Chef::Log.info(`sudo monit restart autols_all-push-server`)
  end
end
