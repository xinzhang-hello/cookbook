execute 'test echo' do
  command "/usr/local/bin/sh echo 'hello'"
  action :run
end