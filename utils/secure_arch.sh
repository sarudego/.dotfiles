#!/bin/bash

# This script will be hardening
# access by ssh and configure fail2ban
# and some features.
# Add to a new user for the system.


function show_info {
  sleep 3s
  echo ""
  echo "[x] $1"
}

clear

show_info "Installing vim..."
x=`pacman -Qs vim`
if [ -n "$x" ]
then
  echo 'vim is installed...'
else
  pacman -S --noconfirm vim
fi

show_info "Changing root password..."
passwd root

show_info "Adding new user..."
read -p "Tell me a user name: " user
useradd -m -g wheel -r $user

show_info "Changing $user password..."
passwd $user

# add user to sudoers file
sed -i -- 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers

show_info "Installing fail2ban"
x=`pacman -Qs fail2ban`
if [ -n "$x" ]
then
  echo 'vim is installed...'
else
  pacman -S --noconfirm fail2ban
fi

show_info "Modifying config fail2ban..."
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.conf.backup
# add this below line after [sshd]
#  enabled  = true
sed '/\[sshd\]/a enabled=true' /etc/fail2ban/jail.conf

show_info "Restarting fail2ban service..."
systemctl restart fail2ban
systemctl status fail2ban


show_info "Modifying config sshd..."
cp /etc/ssh/sshd_config /etc/ssh/backup.sshd_config
read -p "Tell me a new port for ssh: " port_ssh
sed -i -- 's/#Port 22/Port '$port_ssh'/g' /etc/ssh/sshd_config
sed -i -- 's/PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i -- 's/#MaxAuthTries 6/MaxAuthTries 4/g' /etc/ssh/sshd_config
sed -i -- 's/#ClientAliveInterval 0/ClientAliveInterval 300/g' /etc/ssh/sshd_config
sed -i -- 's/#ClientAliveCountMax 3/ClientAliveCountMax 2/g' /etc/ssh/sshd_config
sed -i -- 's/#X11Forwarding yes/X11Forwarging no/g' /etc/ssh/sshd_config
sed -i -- 's/#UseDns no/UseDNS yes/g' /etc/ssh/sshd_config
#sed -i -- 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i -- 's/#PasswordEmptyPasswords no/PasswordEmptyPasswords yes/g' /etc/ssh/sshd_config
mv motd /etc/motd && ls /etc/motd
mv banner /etc/issue && ls /etc/issue
sed -i -- 's/PrintMotd no/PrintMotd yes/g' /etc/ssh/sshd_config
sed -i -- 's/#Banner none/Banner \/etc\/issue/g' /etc/ssh/sshd_config
echo AllowUsers $user /etc/ssh/sshd_config

show_info "Test config sshd..."
x=`sshd -t`
if [ -n "$x" ]
then
  echo 'ssh config is ok... so restart it...'
  show_info "Restarting sshd service..."
  systemctl restart sshd
  systemctl status sshd
else
  echo 'ssh has some problems... you should fix it'
fi


show_info "Regenerate moduli..."
ssh-keygen -G moduli-2048.candidates -b 2048
ssh-keygen -T moduli-2048 -f moduli-2048.candidates
cp moduli-2048 /etc/ssh/moduli
rm moduli-2048

show_info "Changing to $user..."
su - $user



