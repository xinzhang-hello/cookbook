cookbook_file "/etc/profile.d/masterNode" do
  source "masterNode"
  mode 0440
  action :create
end

cookbook_file "/home/ubuntu/deploy" do
  source "dispatcher-deployer"
  mode 0755
end

execute "deploy" do
  user "ubuntu"
  cwd "/home/ubuntu"
  command "./deploy"
end



