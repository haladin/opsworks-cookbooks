Chef::Log.info("Creating monitrc config file for push server ....")

template "/etc/monit/conf.d/autols_all-push-server.monitrc" do
	source 'node_web_app.monitrc.erb'
	owner 'root'
	group 'root'
	mode '0644'
	variables(
	  :dest_path => "#{node[:document_root]}"
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
