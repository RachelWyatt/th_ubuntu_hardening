#
# Cookbook:: th_ubuntu_hardening
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
#cookbook_file is a resource. it controls files


#https://docs.chef.io/resource_cookbook_file.html#syntax
#cookbook_file '/var/www/customers/public_html/index.php' do
#    source 'index.php'
#    owner 'web_admin'
#    group 'web_admin'
#    mode '0755'  -- read write read read -- 
#    action :create
#  end

cookbook_file '/etc/login.defs' do 
    source 'login.defs'
    owner 'root'
    group 'root'
    mode '0644'
    action :create
end

cookbook_file '/etc/modprobe.d/dev-sec.conf' do 
    source 'dev-sec.conf'
    owner 'root'
    group 'root'
    mode '0644'
    action :create
end

sysctl 'net.ipv4.icmp_ratelimit' do
    value 100
    action :apply
end

##I feel like this could be done better??
package "auditd" do
    action :install
end

cookbook_file '/etc/audit/auditd.conf' do
    source 'auditd.conf'
    owner 'root'
    group 'root'
    mode '0640'
    action :create
  end
  ## End Do Better

  sysctl 'net.ipv4.icmp_ratemask' do
    value 88089
    action :apply
  end
  sysctl 'net.ipv4.tcp_timestamps' do
    value 0
    action :apply
  end
  sysctl 'net.ipv4.conf.all.arp_ignore' do
    value 1
    action :apply
  end
  sysctl 'net.ipv4.conf.all.arp_announce' do
    value 2
    action :apply
  end
  sysctl 'net.ipv4.tcp_rfc1337' do
    value 1
    action :apply
  end
  sysctl 'net.ipv4.conf.default.accept_redirects' do
    value 0
    action :apply
  end
  sysctl 'net.ipv4.conf.all.accept_redirects' do
    value 0
    action :apply
  end
  sysctl 'net.ipv4.conf.all.secure_redirects' do
    value 0
    action :apply
  end
  sysctl 'net.ipv4.conf.default.secure_redirects' do
    value 0
    action :apply
  end
  sysctl 'net.ipv4.conf.default.send_redirects' do
    value 0
    action :apply
  end
  sysctl 'net.ipv4.conf.all.send_redirects' do
    value 0
    action :apply
  end
  sysctl 'net.ipv4.conf.all.send_redirects' do
    value 0
    action :apply
  end
  sysctl 'net.ipv4.conf.all.log_martians' do
    value 1
    action :apply
  end
  sysctl 'net.ipv4.conf.default.log_martians' do
    value 1
    action :apply
  end
  sysctl 'net.ipv6.conf.all.disable_ipv6' do
    value 1
    action :apply
  end
  sysctl 'net.ipv6.conf.default.accept_redirects' do
    value 0
    action :apply
  end
  sysctl 'net.ipv6.conf.all.accept_redirects' do
    value 0
    action :apply
  end
  sysctl 'net.ipv6.conf.default.router_solicitations' do
    value 0
    action :apply
  end
  sysctl 'net.ipv6.conf.default.accept_ra_rtr_pref' do
    value 0
    action :apply
  end
  sysctl 'net.ipv6.conf.default.accept_ra_pinfo' do
    value 0
    action :apply
  end
  sysctl 'net.ipv6.conf.default.accept_ra_defrtr' do
    value 0
    action :apply
  end
  sysctl 'net.ipv6.conf.all.accept_ra' do
    value 0
    action :apply
  end
  sysctl 'net.ipv6.conf.default.accept_ra' do
    value 0
    action :apply
  end
  sysctl 'net.ipv6.conf.default.autoconf' do
    value 0
    action :apply
  end
  sysctl 'net.ipv6.conf.default.dad_transmits' do
    value 0
    action :apply
  end
  sysctl 'net.ipv6.conf.default.max_addresses' do
    value 1
    action :apply
  end
  sysctl 'kernel.sysrq' do
    value 0
    action :apply
  end