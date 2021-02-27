cookbook_file "/home/ubuntu/deploy-v2" do
  source "deploy-v2"
  mode 0755
end

execute "deploy-v2" do
  user "ubuntu"
  cwd "/home/ubuntu"
  command "./deploy-v2"
end