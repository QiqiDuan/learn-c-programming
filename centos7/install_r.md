# 在CentOS 7操作系统下安装R语言开发环境

```
# sudo yum install epel-release
Is this ok [y/d/N]: y
安装EPEL软件库。

# sudo yum update
Is this ok [y/d/N]: y
更新EPEL软件库。

# sudo yum install R -y
安装R语言开发环境。

# R --version
验证R语言开发环境是否被正确安装，具体输出如下所示：

R version 3.4.0 (2017-04-21) -- "You Stupid Darkness"
Copyright (C) 2017 The R Foundation for Statistical Computing
Platform: x86_64-redhat-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under the terms of the
GNU General Public License versions 2 or 3.
For more information about these matters see
http://www.gnu.org/licenses/.
```

## 参考资料

[R语言官网](https://cran.r-project.org/index.html)，其安装指南有待更新

[EPEL官网](https://fedoraproject.org/wiki/EPEL)

[R语言RPM安装包中科大镜像网站](https://mirrors.ustc.edu.cn/epel/7/x86_64/r/)
