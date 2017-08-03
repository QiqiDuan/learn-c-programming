# 在CentOS 7操作系统下配置系统时间

```
# yum -y install ntp ntpdate
安装NTP（网络时间协议、Network Time Protocol）。
官方网址：http://www.ntp.org/

# ntpdate cn.pool.ntp.org
更新系统时间，使其与UTC时间同步。

# hwclock --systohc
将系统时间写入硬件时间。
```

## 系统时间管理工具

```timedatectl```：是```systemd```系统的一部分。

```date```：最基本的系统时间管理工具。

```hwclock```：硬件时间管理工具。

## 常用时间汇总

UTC（Coordinated Universal Time）：协调世界时。

CST：China Standard Time UT+8:00（中国标准时间）、Central Standard Time (USA) UT-6:00（美国中部时间）。

```
# date
# date -u
# cal
# cal 2017
# cal 08 2017

# uptime
```

## 参考资料

[《Red Hat Enterprise Linux 7 System Administrator's Guide》](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/pdf/System_Administrators_Guide/Red_Hat_Enterprise_Linux-7-System_Administrators_Guide-en-US.pdf)
Chapter 2. Configuring the Date and Time
