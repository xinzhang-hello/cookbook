cookbook_file "/tmp/deploy-aws.sh" do
  source "deploy-aws.sh"
  mode 0755
end

cookbook_file "/tmp/deploy" do
  source "deploy"
  mode 0755
end

execute "deploy" do
  user "root"
  cwd "/tmp"
  command "./deploy"
end