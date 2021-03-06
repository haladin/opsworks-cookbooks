ruby_block "Run NPM Install" do
  block do
    Chef::Log.info("Installing node modules in #{node[:document_root]}/current NODE_ENV=#{node[:nodeJS_env]}")
	# packet.json should be fixed to include grunt not only in development
    Chef::Log.info(`sudo su - deploy -c 'cd #{node[:document_root]}/current && NODE_ENV=development npm install'`)
    raise "NPM Install FAILED" unless $?.success?
  end
end

Chef::Log.info("Install Grunt and Boower")
execute "install grunt" do
  command "sudo NODE_ENV=#{node[:nodeJS_env]} npm install -g bower grunt-cli"
  not_if "[ -f /usr/local/bin/grunt ]"
end

ruby_block "Run Bower Install" do
  block do
    Chef::Log.info("bower install")
    Chef::Log.info(`sudo su - deploy -c 'cd #{node[:document_root]}/current && bower install --allow-root'`)
    raise "Bower Install FAILED" unless $?.success?
  end
end

ruby_block "Run Grunt Build" do
  block do
    Chef::Log.info("grunt build")
    Chef::Log.info(`sudo su - deploy -c 'cd #{node[:document_root]}/current && NODE_ENV=#{node[:nodeJS_env]} grunt build'`)
    raise "Grunt Build FAILED" unless $?.success?
  end
end


