
ruby_block "Update packages...." do
  block do
    Chef::Log.info("Update packages....")
    Chef::Log.info(`sudo apt-get update`)
    raise "Package update FAILED" unless $?.success?
  end
end

if node[:mongodb]
	Chef::Log.info("Installing local mongoDB ....")
	package "mongodb" do
	  action :install
	end
end
	
Chef::Log.info("Installing nginx ....")
package "nginx" do
  action :install
end

Chef::Log.info("Installing daemontools ....")
package "daemontools" do
  action :install
end