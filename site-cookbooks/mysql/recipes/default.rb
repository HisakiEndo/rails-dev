bash "Add Mysql repo" do
  user "root"
  cwd "/tmp"
  code <<-EOC
    rpm -Uvh #{node['mysql']['remote_url']}
  EOC
  not_if { File.exists? "/etc/yum.repos.d/mysql-community.repo" }
end

package 'mysql-server'

service "mysqld" do
  action [ :enable, :start ]
end