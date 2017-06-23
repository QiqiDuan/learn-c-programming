# 在CentOS 7操作系统下安装Scala语言开发环境

```
# wget https://downloads.lightbend.com/scala/2.11.11/scala-2.11.11.rpm
获取Scala-2.11.11的RPM安装包。

# sudo yum localinstall -y scala-2.11.11.rpm
安装命令。

# scala -version
查看安装是否成功，具体的输出如下所示：
Scala code runner version 2.11.11 -- Copyright 2002-2017, LAMP/EPFL

# which scala
# ls -l /usr/bin/scala
# ls -l /usr/share/scala/bin/scala
查看实际的安装位置。

# sudo vi /etc/profile.d/scala.sh
配置Scala语言的系统环境变量，具体内容如下所示：
export SCALA_HOME=/usr/share/scala
export PATH=${SCALA_HOME}/bin:${PATH}

# . /etc/profile.d/scala.sh
# echo $SCALA_HOME
# echo $PATH
使得以上的系统环境变量生效，并加以验证。
```

## 参考资料

[Scala语言官网](https://www.scala-lang.org/download/install.html)
