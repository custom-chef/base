#
# Cookbook:: base
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# git, vim, mysql-client
["yum-utils", "git", "vim"].each do |package|
  package "#{package}"
end

# for php
[
  "bzip2-devel",
  "libc-client-devel",
  "curl-devel",
  "freetype-devel",
  "gmp-devel",
  "libjpeg-devel",
  "krb5-devel",
  "libmcrypt-devel",
  "libpng-devel",
  "openssl-devel",
  "t1lib-devel",
  "libxml2-devel",
  "libxslt-devel",
  "zlib-devel"
].each do|pkg|
    package pkg
end

user "deploy" do
    uid 1000
    comment "for deployment"
    home "/var/www/sites"
    shell "/bin/bash"
    password nil
    action :create
end

directory "/var/www/sites" do
    owner "deploy"
    group "deploy"
    recursive true
    mode 0755
    action :create
end

group "deploy" do
    gid 1000
    members ['deploy']
    action :create
end

group "deploy" do
    action :modify
    members ['deploy']
end
