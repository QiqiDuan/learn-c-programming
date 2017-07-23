# 在Ubuntu16.04操作系统上安装FTP服务器

检查vsftpd是否已经被安装。
```
# vsftpd -version
```

安装vsftpd命令。
```
# sudo apt-get install vsftpd
```

检查vsftpd是否安装成功。
```
# vsftpd -version
vsftpd: version 3.0.3
```

建立FTP用户。
```
sudo mkdir /home/ftpuser000
sudo useradd -g ftp -d /home/ftpuser000/ -s /usr/sbin/nologin ftpuser000
sudo passwd ftpuser000
sudo chmod 777 /home/ftpuser000/
sudo vi /etc/shells # 在此文件尾部添加一行内容，如下所示：
/usr/sbin/nologin
```

配置vsftpd服务器。
```
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.old # 备份vsftpd配置文件
sudo vi /etc/vsftpd.conf
# Allow anonymous FTP? (Disabled by default).
anonymous_enable=NO
#
# Uncomment this to allow local users to log in.
local_enable=YES
#
# Uncomment this to enable any form of FTP write command.
write_enable=YES
#
# Default umask for local users is 077. You may wish to change this to 022,
# if your users expect that (022 is used by most other ftpd's)
local_umask=022

# You may specify an explicit list of local users to chroot() to their home
# directory. If chroot_local_user is YES, then this list becomes a list of
# users to NOT chroot().
# (Warning! chroot'ing can be very dangerous. If using chroot, make sure that
# the user does not have write access to the top level directory within the
# chroot)
chroot_local_user=YES
chroot_list_enable=YES
# (default follows)
chroot_list_file=/etc/vsftpd.chroot_list
```

配置FTP用户信息。
```
sudo vi /etc/vsftpd.chroot_list
ftpuser000
```

FTP服务常用命令。
```
# service vsftpd start
# service vsftpd stop
# service vsftpd restart
# netstat -tl | grep ftp
# ftp ip-address
```

获取FTP服务器的IP地址。
```
# ip addr
```
