cookbook_file "/tmp/deploy" do
  source "deploy"
  mode 0755
end

execute "deploy" do
  user "root"
  cwd "/tmp"
  command "./deploy"
end