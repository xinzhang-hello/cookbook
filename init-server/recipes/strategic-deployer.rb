cookbook_file "/home/ubuntu/deploy" do
  source "strategic-deployer"
  mode 0755
end

execute "deploy" do
  user "ubuntu"
  cwd "/home/ubuntu"
  command "./deploy"
end


