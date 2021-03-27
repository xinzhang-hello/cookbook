cookbook_file "/home/ubuntu/deploy" do
  source "strategic-deployer"
  mode 0755
end

execute "deploy" do
  user "ubuntu"
  cwd "/home/ubuntu"
  command "./deploy"
end

cookbook_file "/etc/cron.d/synctime" do
  source "synctime"
  mode 0440
  action :create
end

