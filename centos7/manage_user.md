# 在CentOS 7操作系统下管理用户

```
# adduser user-name
新增用户user-name（在home目录下创建账号文件夹）。

# useradd user-name
新增用户user-name（不在home目录下创建账号文件夹）。

# passwd user-name
为用户user-name设置密码。

# usermod -aG wheel user-name
添加用户user-name到wheel用户组中（拥有su权限）。

# userdel -r user-name
删除用户。
```

## 参考资料

[《Red Hat Enterprise Linux 7 System Administrator's Guide》](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/pdf/System_Administrators_Guide/Red_Hat_Enterprise_Linux-7-System_Administrators_Guide-en-US.pdf)
Chapter 3. Managing Users and Groups
