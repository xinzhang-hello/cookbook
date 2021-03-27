cookbook_file "/home/ubuntu/configure" do
  source "configure"
  mode 0755
end

execute "configure" do
  user "ubuntu"
  cwd "/home/ubuntu"
  command "./configure"
end

cookbook_file "/etc/cron.d/synctime" do
  source "synctime"
  mode 0440
  action :create
end