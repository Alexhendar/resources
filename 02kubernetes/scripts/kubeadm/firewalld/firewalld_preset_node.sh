# 重启防火墙
systemctl enable firewalld
systemctl restart firewalld
# systemctl status firewalld

#master节点
firewall-cmd --zone=public --add-port=10250/tcp --permanent
firewall-cmd --zone=public --add-port=30000-32767/tcp --permanent

firewall-cmd --reload
# 查看端口开放状态
firewall-cmd --list-all --zone=public
