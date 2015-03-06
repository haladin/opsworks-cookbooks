Chef::Log.info("Creating push server log directory: #{node[:document_root]}/push-logs")
directory "#{node[:document_root]}/push-logs" do
  owner 'deploy'
  group 'www-data'
  mode '0644'
  action :create
end