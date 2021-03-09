cookbook_file "/etc/cron.d/synctime" do
  source "synctime"
  mode 0440
  action :create
end