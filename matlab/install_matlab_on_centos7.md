# 在CentOS 7操作系统下安装MATLAB R2016b命令行版本

**在Linux操作系统下，除了MATLAB 图形界面（GUI）版本，还有MATLAB命令行（CMD）版本。**

操作系统版本：CentOS 7。

MATLAB版本：MATLAB R2016b（完整的安装包大约有：12.6 GB）。

## 获取MATLAB的license许可文件

通过MATLAB官网，登录到个人的MATLAB账号，按照以下的流程进行操作（主要在```License Center```中进行）：

```
---> Associate License （关联许可证）
---> License Center 
---> License 
---> Select a License 
---> Install and Activate 
---> Update License File 
---> Activate a Computer 
---> Host ID
```

建议使用机器的MAC地址作为Host ID，获取机器的MAC地址命令如下：

```
dmesg | grep eth0
```

通过以上操作，可以生成的```license.lic```文件，并获取```fileInstallationKey```。

## 选择MATLAB安装包所在目录与MATLAB的安装目录并授权

建议记录MATLAB安装包所在目录与MATLAB的安装目录，以便修改MATLAB的安装配置文件。

MATLAB安装包所在目录为：```/home/duanqq/MATLAB/R2016b/dvd/```。```dvd```版本：支持离线安装，安装速度较快。

MATLAB的安装目录为：```/usr/local/R2016b/```。

```
# sudo chmod 777 -R /home/duanqq/MATLAB/R2016b/dvd
# cd /usr/local/
# sudo mkdir R2016b
# sudo chmod 777 -R /usr/local/R2016b/
```

## 修改MATLAB的安装配置文件

配置```activate.ini```文件。

```
# cd /home/duanqq/MATLAB/R2016b/dvd
# cp activate.ini activate.ini.old # 备份配置文件
# vi activate.ini # 替代为以下内容
isSilent=true
activateCommand=activateOffline
licenseFile=/home/duanqq/MATLAB/R2016b/dvd/license.lic
```

配置```installer_input.txt```文件。

```
# cp installer_input.txt installer_input.txt.old # 备份配置文件
# vi installer_input.txt # 替代为以下内容
destinationFolder=/usr/local/R2016b
fileInstallationKey=需要自行设置
agreeToLicense=yes
outputFile=/tmp/mathworks_install.log
mode=silent
activationPropertiesFile=/home/duanqq/MATLAB/R2016b/dvd/activate.ini
lmgrFiles=false
```

将生成的```license.lic```文件，放入MATLAB安装包所在目录。

## 运行MATLAB安装命令

```
# sudo ./install -inputFile /home/duanqq/MATLAB/R2016b/dvd/installer_input.txt
输出结果如下所示：
Preparing installation files ...
Installing ...
(Aug 04, 2017 10:09:56) ##################################################################
(Aug 04, 2017 10:09:56) #
(Aug 04, 2017 10:09:56) # Today's Date:
(Aug 04, 2017 10:09:56) Fri Aug 04 10:09:55 CST 2017
(Aug 04, 2017 10:09:56)
(Aug 04, 2017 10:09:56) System Info
(Aug 04, 2017 10:09:56) OS: Linux 3.10.0-514.21.2.el7.x86_64
(Aug 04, 2017 10:09:56) Arch: amd64
(Aug 04, 2017 10:09:56) Data Model: 64
(Aug 04, 2017 10:09:56) Language: en
(Aug 04, 2017 10:09:56) Java Vendor: Oracle Corporation
(Aug 04, 2017 10:09:56) Java Home: /tmp/mathworks_3362/sys/java/jre/glnxa64/jre
(Aug 04, 2017 10:09:56) Java Version: 1.7.0_60
(Aug 04, 2017 10:09:56) Java VM Name: Java HotSpot(TM) 64-Bit Server VM
(Aug 04, 2017 10:09:56) Java Class Path: /tmp/mathworks_3362/java/config/professionalinstaller/pathlist.jar
(Aug 04, 2017 10:09:56) User Name: root
(Aug 04, 2017 10:09:56) Current Directory: /tmp/mathworks_3362
(Aug 04, 2017 10:09:56) Input arguments:
(Aug 04, 2017 10:09:56) root /home/duanqq/MATLAB/R2016b/dvd
(Aug 04, 2017 10:09:56) libdir /tmp/mathworks_3362
(Aug 04, 2017 10:09:56) inputFile /home/duanqq/MATLAB/R2016b/dvd/installer_input.txt
(Aug 04, 2017 10:09:56) standalone true
(Aug 04, 2017 10:09:56) Input file:
destinationFolder=/usr/local/R2016b
fileInstallationKey=
agreeToLicense=yes
outputFile=/tmp/mathworks_install.log
mode=silent
activationPropertiesFile=/home/duanqq/MATLAB/R2016b/dvd/activate.ini
lmgrFiles=false

(Aug 04, 2017 10:09:57) Starting local product/component search in download directory
(Aug 04, 2017 10:09:57) Searching for archives...
(Aug 04, 2017 10:09:57) Reading /home/duanqq/MATLAB/R2016b/dvd/archives
(Aug 04, 2017 10:09:57) Extracting /home/duanqq/MATLAB/R2016b/dvd/archives/platform_common.zip
(Aug 04, 2017 10:09:57) Extracting /home/duanqq/MATLAB/R2016b/dvd/archives/platform_glnxa64.zip
(Aug 04, 2017 10:09:57) Extracting /home/duanqq/MATLAB/R2016b/dvd/archives/platform_maci64.zip
(Aug 04, 2017 10:09:57) Extracting /home/duanqq/MATLAB/R2016b/dvd/archives/platform_win64.zip
(Aug 04, 2017 10:09:57) Reading /home/duanqq/MATLAB/R2016b/dvd
(Aug 04, 2017 10:09:57) 26 files found in /home/duanqq/MATLAB/R2016b/dvd
(Aug 04, 2017 10:09:57) /root/Downloads/MathWorks/R2016b/archives doesn't exist ... skipping.
(Aug 04, 2017 10:09:57) Archive search complete.  30 total files found.
(Aug 04, 2017 10:09:57) Assembling product list...
(Aug 04, 2017 10:09:59) Completed local product/component search
(Aug 04, 2017 10:09:59) Installing Product: MATLAB 9.1
(Aug 04, 2017 10:10:26) Installing Product: Simulink 8.8
(Aug 04, 2017 10:10:46) Installing Product: Bioinformatics Toolbox 4.7
(Aug 04, 2017 10:10:49) Installing Product: Communications System Toolbox 6.3
(Aug 04, 2017 10:10:54) Installing Product: Computer Vision System Toolbox 7.2
(Aug 04, 2017 10:11:02) Installing Product: Control System Toolbox 10.1
(Aug 04, 2017 10:11:04) Installing Product: Curve Fitting Toolbox 3.5.4
(Aug 04, 2017 10:11:04) Installing Product: Database Toolbox 7.0
(Aug 04, 2017 10:11:05) Installing Product: DSP System Toolbox 9.3
(Aug 04, 2017 10:11:09) Installing Product: Econometrics Toolbox 3.5
(Aug 04, 2017 10:11:10) Installing Product: Embedded Coder 6.11
(Aug 04, 2017 10:11:12) Installing Product: Financial Instruments Toolbox 2.4
(Aug 04, 2017 10:11:13) Installing Product: Financial Toolbox 5.8
(Aug 04, 2017 10:11:14) Installing Product: Fixed-Point Designer 5.3
(Aug 04, 2017 10:11:15) Installing Product: Fuzzy Logic Toolbox 2.2.24
(Aug 04, 2017 10:11:15) Installing Product: Global Optimization Toolbox 3.4.1
(Aug 04, 2017 10:11:16) Installing Product: HDL Coder 3.9
(Aug 04, 2017 10:11:20) Installing Product: Image Processing Toolbox 9.5
(Aug 04, 2017 10:11:29) Installing Product: Instrument Control Toolbox 3.10
(Aug 04, 2017 10:11:30) Installing Product: MATLAB Coder 3.2
(Aug 04, 2017 10:11:31) Installing Product: MATLAB Compiler 6.3
(Aug 04, 2017 10:11:44) Installing Product: MATLAB Report Generator 5.1
(Aug 04, 2017 10:11:44) Installing Product: Model Predictive Control Toolbox 5.2.1
(Aug 04, 2017 10:11:45) Installing Product: Neural Network Toolbox 9.1
(Aug 04, 2017 10:11:47) Installing Product: Optimization Toolbox 7.5
(Aug 04, 2017 10:11:48) Installing Product: Parallel Computing Toolbox 6.9
(Aug 04, 2017 10:11:51) Installing Product: Partial Differential Equation Toolbox 2.3
(Aug 04, 2017 10:11:51) Installing Product: Risk Management Toolbox 1.0
(Aug 04, 2017 10:11:52) Installing Product: Robotics System Toolbox 1.3
(Aug 04, 2017 10:11:54) Installing Product: Robust Control Toolbox 6.2
(Aug 04, 2017 10:11:54) Installing Product: Signal Processing Toolbox 7.3
(Aug 04, 2017 10:11:57) Installing Product: Simscape 4.1
(Aug 04, 2017 10:11:59) Installing Product: Simscape Driveline 2.11
(Aug 04, 2017 10:12:00) Installing Product: Simscape Electronics 2.10
(Aug 04, 2017 10:12:00) Installing Product: Simscape Fluids 2.1
(Aug 04, 2017 10:12:01) Installing Product: Simscape Multibody 4.9
(Aug 04, 2017 10:12:04) Installing Product: Simscape Power Systems 6.6
(Aug 04, 2017 10:12:06) Installing Product: Simulink Coder 8.11
(Aug 04, 2017 10:12:08) Installing Product: Simulink Control Design 4.4
(Aug 04, 2017 10:12:09) Installing Product: Simulink Design Optimization 3.1
(Aug 04, 2017 10:12:10) Installing Product: Simulink Report Generator 5.1
(Aug 04, 2017 10:12:11) Installing Product: Stateflow 8.8
(Aug 04, 2017 10:12:11) Installing Product: Statistics and Machine Learning Toolbox 11.0
(Aug 04, 2017 10:12:14) Installing Product: Symbolic Math Toolbox 7.1
(Aug 04, 2017 10:12:22) Installing Product: System Identification Toolbox 9.5
(Aug 04, 2017 10:12:24) Installing Product: Wavelet Toolbox 4.17
(Aug 04, 2017 10:12:32) Notes:
Your installation may require additional configuration steps.

1. The following products require a supported compiler:

Stateflow 8.8
Simulink Coder 8.11
MATLAB Coder 3.2

2. Simulink requires a C compiler for simulation acceleration, model reference, and MATLAB Function Block capabilities. It is recommended that you install a supported compiler on your machine.

3. To accelerate computations with the following products, a supported compiler is required:

Fixed-Point Designer 5.3
(Aug 04, 2017 10:12:33) Exiting with status 0
Silent activation succeeded.
(Aug 04, 2017 10:12:37) End - Successful.
Finished
```

## 配置系统环境变量

```
# cd
# vi .bash_profile
在文件尾部添加以下内容：
# Add path for MATLAB R2016b
MATLAB=/usr/local/R2016b/bin
PATH=${PATH}:${MATLAB}
export PATH

# . .bash_profile
# echo $MATLAB
```

## 检测MATLAB软件是否安装成功

运行MATLAB命令

```
# matlab
MATLAB is selecting SOFTWARE OPENGL rendering.

                              < M A T L A B (R) >
                    Copyright 1984-2016 The MathWorks, Inc.
                     R2016b (9.1.0.441655) 64-bit (glnxa64)
                               September 7, 2016


To get started, type one of these: helpwin, helpdesk, or demo.
For product information, visit www.mathworks.com.

>>
```

## 致谢

感谢MATLAB技术支持人员的邮件指南！

* ************************************************* *
DQQ077 (段琦琦) [duanqq@mail.sustc.edu.cn || duanqq077@qq.com]，SUSTC-CS-OPAL

2017-08-04 11:00:00
* ************************************************* *
