execute "change localtime to JST 1" do
    user "root"
    command "cp -p /usr/share/zoneinfo/Japan /etc/localtime"
    not_if "diff /usr/share/zoneinfo/Japan /etc/localtime"
end

execute "change localtime to JST 2" do
    user "root"
    command "echo 'ZONE=\"Asia/Tokyo\"' > /etc/sysconfig/clock"
    not_if "grep 'ZONE=\"Asia/Tokyo\"' /etc/sysconfig/clock"
end

execute "change localtime to JST 3" do
    user "root"
    command "echo 'UTC=false' >> /etc/sysconfig/clock"
    not_if "grep 'UTC=false' /etc/sysconfig/clock"
end
