# 重启防火墙
systemctl enable firewalld
systemctl restart firewalld
# systemctl status firewalld

#master节点
firewall-cmd --zone=public --add-port=32321/tcp --permanent
firewall-cmd --zone=public --add-port=8088/tcp --permanent
firewall-cmd --zone=public --add-port=16443/tcp --permanent
firewall-cmd --zone=public --add-port=6443/tcp --permanent
firewall-cmd --zone=public --add-port=4001/tcp --permanent
firewall-cmd --zone=public --add-port=2379-2380/tcp --permanent
firewall-cmd --zone=public --add-port=10250/tcp --permanent
firewall-cmd --zone=public --add-port=10251/tcp --permanent
firewall-cmd --zone=public --add-port=10252/tcp --permanent
firewall-cmd --zone=public --add-port=30000-32767/tcp --permanent

firewall-cmd --reload
# 查看端口开放状态
firewall-cmd --list-all --zone=public
