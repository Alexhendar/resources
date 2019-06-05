# 设置elrepo，linux内核更新yum源
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh https://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm

# 查看最新的操作系统内核版本，这里版本为5.0.9-1.el7.elrepo
# yum --disablerepo="*" --enablerepo="elrepo-kernel" list available
yum --disablerepo="*" --enablerepo="elrepo-kernel" install -y kernel-ml-5.1.1-1.el7.elrepo

# 修改/etc/default/grub的启动选项
cp -f /root/kubeadm/kernel/grub /etc/default/grub

grub2-mkconfig -o /boot/grub2/grub.cfg

