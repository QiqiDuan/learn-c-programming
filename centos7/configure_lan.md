# 在CentOS 7操作系统下配置局域网连接

```
# nmcli d
确定可以连接的网络端口（例如，em1、em2、em3、em4等）。

# nmtui
选择“Edit a connection”，
选择“可以连接的网络端口”，
选择“<Edit...>”，
修改“[ ] Automatically connect”为“[X] Automatically connect”。

# systemctl restart network
重新开启网络服务。

# ip addr 
测试是否获取局域网IP地址。

# ping ping www.sustc.edu.cn
验证网络连接是否成功（以校园网为例）。
```

## 解决“Failed to start LSB : Bring up/down networking”问题

问题产生原因：在配置过程中，更换网络端口（例如将em1端口改为em4端口）。

解决方案：删除所有的网络连接配置，新建连接即可（建议连接名与端口名相同）。

## 解决“网络无法自动启动”问题

问题产生原因：使用```systemctl disable NetworkManager```后，未恢复网络自动启动。

解决方案：```systemctl enable NetworkManager.service```。

查看系统自动启动项：```systemctl list-unit-files | grep NetworkManager```，输出如下所示：

```
dbus-org.freedesktop.NetworkManager.service enabled
NetworkManager-dispatcher.service           enabled
NetworkManager-wait-online.service          enabled
NetworkManager.service                      enabled
```
