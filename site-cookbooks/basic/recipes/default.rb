# Update all
execute "yum-update" do
  user "root"
  command "yum -y update"
  action :run
end

# Timezone
bash "Change Timezone" do
  user "root"
  cwd "/tmp"
  code <<-EOC
    mv /etc/localtime /etc/localtime.bak
    ln -s /usr/share/zoneinfo/Japan /etc/localtime
  EOC
end

package 'ntp'

service "ntpd" do
  action [ :enable, :start ]
end

# Basic build package for Centos
package 'autoconf'
package 'bison'
package 'flex'
package 'gcc'
package 'gcc-c++'
package 'kernel-devel'
package 'make'
package 'm4'
package 'patch'

package 'git'
package 'curl'
package 'mysql-devel'

