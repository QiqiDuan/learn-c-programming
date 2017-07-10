# 在CentOS 7操作系统下安装JAVA JDK开发环境

```
# java -version
查看CentOS 7操作系统默认安装的JAVA JDK软件版本，具体输出如下所示：
openjdk version "1.8.0_131"
OpenJDK Runtime Environment (build 1.8.0_131-b12)
OpenJDK 64-Bit Server VM (build 25.131-b12, mixed mode)

# sudo yum -y remove java*
删除CentOS 7操作系统默认安装的JAVA JDK软件版本。

# sudo yum install wget
# wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" 
  http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm?
获取ORACLE公司提供的JAVA JDK软件版本：jdk-8u131-linux-x64.rpm。
特别注意：以上的JAVA JDK软件版本会不断地进行更新，建议使用最新版本。

# sudo yum localinstall jdk-8u131-linux-x64.rpm
安装JAVA JDK的RPM软件包。

# java -version
验证JAVA JDK软件是否被成功安装，具体输出如下所示：
java version "1.8.0_131"
Java(TM) SE Runtime Environment (build 1.8.0_131-b11)
Java HotSpot(TM) 64-Bit Server VM (build 25.131-b11, mixed mode)

# which java
# ls -l /usr/bin/java
# ls -l /etc/alternatives/java
# ls -l /usr/java/jdk1.8.0_131/jre/bin/java
查看JAVA JDK软件的实际安装位置。

# sudo alternatives --config java
如存在多个JAVA JDK软件版本，可能需要使用以上的命令进行选择、配置。

# sudo vi /etc/profile.d/java.sh
特别注意：/usr/java/jdk1.8.0_131/bin/java与/usr/java/jdk1.8.0_131/jre/bin/java之间的区别，具体解释见下文中的参考资料部分。
配置JAVA JDK软件的系统环境变量，具体内容如下所示：
export JAVA_HOME=/usr/java/jdk1.8.0_131
export PATH=${JAVA_HOME}/bin:${PATH}

# . /etc/profile.d/java.sh
# echo $JAVA_HOME
# echo $PATH
使得以上的系统环境变量生效，并加以验证。

# which java
查看JAVA JDK软件的实际安装位置，具体输出如下所示：
/usr/java/jdk1.8.0_131/bin/java
```

## 参考资料

[Java SE Development Kit 8官方下载网址](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

[/usr/java/jdk1.8.0_131/bin/java与/usr/java/jdk1.8.0_131/jre/bin/java之间的区别](https://unix.stackexchange.com/questions/134985/whats-the-difference-between-java-located-inside-jdk-bin-and-jdk-jre-bin)
