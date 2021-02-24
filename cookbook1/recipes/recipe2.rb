cookbook_file "/home/ubuntu/deploy-aws.sh" do
  source "deploy-aws.sh"
  mode 0755
end

cookbook_file "/home/ubuntu/deploy" do
  source "deploy"
  mode 0755
end

execute "deploy" do
  user "ubuntu"
  cwd "/home/ubuntu"
  command "./deploy"
end