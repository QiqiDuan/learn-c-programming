# 在CentOS 7操作系统下安装Python语言开发环境

```
# python -V
查看CentOS 7操作系统默认安装的Python软件版本：
Python 2.7.5

# which python
查看Python软件具体的安装位置：
/usr/bin/python

# ls -l /usr/bin/python
# ls -l /usr/bin/python2
# ls -l /usr/bin/python2.7

# sudo yum install python34
安装Python软件3.4版本。

# sudo yum install python34-setuptools
# sudo easy_install-3.4 pip
# sudo yum install python34-devel -y
安装Python软件3.4版本必要的开发工具。

运行以上命令，会升级pip版本；同时维持pip与pip3的方式有：
# pip -V
# sudo yum install python-pip
# pip -V
# pip3 -V

# python3 --version
验证Python3.4版本是否安装成功。
Python 3.4.5

# sudo yum install libffi-devel openssl-devel -y
# sudo pip3 install Scrapy
基于Python软件3.4版本，安装Scrapy软件包。

$ python3
Python 3.4.5 (default, May 29 2017, 15:17:55)
[GCC 4.8.5 20150623 (Red Hat 4.8.5-11)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import scrapy
>>> scrapy.__file__
'/usr/lib/python3.4/site-packages/scrapy/__init__.py'
```

## 参考资料

[Python语言官网](https://www.python.org/)

[Pip软件包安装官方指南](https://packaging.python.org/guides/installing-using-linux-tools/)

[Scrapy软件包安装问题解决方案](https://stackoverflow.com/questions/22073516/failed-to-install-python-cryptography-package-with-pip-and-setup-py)
