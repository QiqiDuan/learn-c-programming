# 在CentOS 7操作系统下管理用户

```
系统管理、用户管理：永远是一个经验学习的过程。
```

系统管理员：system administration、sysadmin、admin。

用户标识：userid、user identification。习惯上用户标识仅使用小写字母。

超级用户：root。SHELL提示符以```#```开头。

```
# adduser user-name
新增用户user-name，并在home目录下创建账号文件夹。
对比：Ubuntu操作系统下，在home目录下创建账号文件夹。

# useradd user-name
新增用户user-name，并在home目录下创建账号文件夹。
对比：Ubuntu操作系统下，不在home目录下创建账号文件夹。

# passwd user-name
为用户user-name设置密码（需要root权限）。

# passwd
修改密码。

# usermod -aG wheel user-name
添加用户user-name到wheel用户组中（拥有su权限）。

# userdel -r user-name
删除用户。

# last user-name
# who
查看系统最近登录记录（包含重启）。

# logout
# exit
# CTRL-D
退出系统、关闭SHELL。
```

## 参考资料

[《Red Hat Enterprise Linux 7 System Administrator's Guide》](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/pdf/System_Administrators_Guide/Red_Hat_Enterprise_Linux-7-System_Administrators_Guide-en-US.pdf)
Chapter 3. Managing Users and Groups

Hahn H. Harley Hahn's guide to Unix and Linux. McGraw-Hill, Inc.; 2008 Feb 7.
