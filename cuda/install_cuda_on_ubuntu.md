# 在Ubuntu 16.04上安装CUDA并行计算开发环境

## 基本信息

英伟达GPU型号 --- NVIDIA Corporation GK110GL [Tesla K20c]，共2颗。

操作系统版本 --- Ubuntu 16.04.2 LTS [Xenial Xerus]。

CUDA开发工具包版本 --- cuda_8.0.61_375.26_linux。

## 阅读CUDA官方安装指南

阅读[CUDA官方安装指南](http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#axzz4jfhzZkWA)，**强烈推荐**。

注意此官方安装指南会不断地进行更新（已参考的版本有：DU-05347-001_v8.0 | January 2017、DU-05347-001_v8.0 | June 2017）。

```
查看英伟达GPU型号与颗数
$ lspci | grep -i nvidia
82:00.0 3D controller: NVIDIA Corporation GK110GL [Tesla K20c] (rev a1)
83:00.0 3D controller: NVIDIA Corporation GK110GL [Tesla K20c] (rev a1)

查看操作系统版本
$ uname -m && cat /etc/os-release
x86_64
NAME="Ubuntu"
VERSION="16.04.2 LTS (Xenial Xerus)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 16.04.2 LTS"
VERSION_ID="16.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
VERSION_CODENAME=xenial
UBUNTU_CODENAME=xenial

查看GCC编译器版本
$ gcc --version
gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

查看操作系统内核信息
$ uname -r
4.8.0-46-generic （第一次安装显示的信息）
4.8.0-53-generic （第二次安装显示的信息）
4.8.0-54-generic （第三次安装显示的信息）

特别注意：默认情况下，Ubuntu 16.04会不断地升级内核，导致已安装的GPU驱动失效。
为了避免重复安装GPU驱动，可禁止内核更新！

安装Linux内核头文件
$ sudo apt-get install linux-headers-$(uname -r)
linux-headers-4.8.0-53-generic is already the newest version (4.8.0-53.56~16.04.1). （第二次安装显示的信息）
linux-headers-4.8.0-54-generic is already the newest version (4.8.0-54.57~16.04.1). （第三次安装显示的信息）

特别注意：Python为3.5版本时，不能成功运行以上安装Linux内核头文件命令。建议将其配置为2.7版本。

具体的Python配置命令如下所示：
$ update-alternatives --config python
$ python --version
Python 2.7.12
```

安装CUDA并行计算开发环境存在两种方式：```distribution-specific packages```与```distribution-independent package```。

虽然采用```distribution-specific packages```方式安装看似比较简单，但很可能会遇到**循环登录**等问题（截止2017-06-11）。

推荐使用```distribution-independent package```方式进行安装。具体流程如下所示：

## 检查安装前提条件

```
安装文件校对
$ md5sum cuda_8.0.61_375.26_linux.run
33e1bd980e91af4e55f3ef835c103f9b cuda_8.0.61_375.26_linux.run
```

## 使用命令行模式安装

采用纯文本命令行模式进行安装，切勿使用GUI界面模式。

既可使用本地纯文本命令行模式，也可使用远程纯文本命令行模式。

```
切换到本地纯文本命令行模式快捷键：Ctrl + Alt + F1~F6
切换到本地GUI界面模式快捷键：Ctrl + Alt + F7

禁用本地界面模式
$ sudo service lightdm stop

删除文件/etc/X11/xorg.conf（如果存在的话）
安装之前与安装成功之后，都没有xorg.conf文件
$ ls /etc/X11/ | grep -i xorg

检查禁用Nouveau是否成功
$ lsmod | grep nouveau
如果没有任何输出，表示禁用成功。

禁用nouveau
创建名为blacklist-nouveau.conf的文件
添加一行即可，不要随意换行；虽然官方指南有换行
$ vi /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau option nouveau modeset=0

$ sudo update-initramfs -u
update-initramfs: Generating /boot/initrd.img-4.8.0-54-generic
```

下载[CUDA](https://developer.nvidia.com/cuda-downloads)，下载的版本为：cuda_8.0.61_375.26_linux.run（不推荐使用.deb安装包）。

```
赋予执行权限
$ chmod a+x cuda_8.0.61_375.26_linux.run
$ ls -al
-rwxrwxr-x

执行安装程序，特别注意相关参数的设置。不能安装opengl-libs，否则会出现循环登录问题！！！
$ sudo sh cuda_8.0.61_375.26_linux.run --no-opengl-libs

安装过程中，选择：接收安装协议，安装NVIDIA驱动，安装CUDA工具包，安装CUDA示例；但不接收Xserver配置服务。具体流程如下所示：

accept/decline/quit: accept

Install NVIDIA Accelerated Graphics Driver for Linux-x86_64 375.26?
(y)es/(n)o/(q)uit: y

Do you want to run nvidia-xconfig?
This will update the system X configuration file so that the NVIDIA X driver
is used. The pre-existing X configuration file will be backed up.
This option should not be used on systems that require a custom
X configuration, such as systems with multiple GPU vendors.
(y)es/(n)o/(q)uit [ default is no ]: n

Install the CUDA 8.0 Toolkit?
(y)es/(n)o/(q)uit: y

Enter Toolkit Location
 [ default is /usr/local/cuda-8.0 ]:

Do you want to install a symbolic link at /usr/local/cuda?
(y)es/(n)o/(q)uit: y

Install the CUDA 8.0 Samples?
(y)es/(n)o/(q)uit: y

Enter CUDA Samples Location
 [ default is /root ]:

Installing the NVIDIA display driver...
Installing the CUDA Toolkit in /usr/local/cuda-8.0 ...
Installing the CUDA Samples in /root ...
Copying samples to /root/NVIDIA_CUDA-8.0_Samples now...
Finished copying samples.

===========
= Summary =
===========

Driver:   Installed
Toolkit:  Installed in /usr/local/cuda-8.0
Samples:  Installed in /root

Please make sure that
 -   PATH includes /usr/local/cuda-8.0/bin
 -   LD_LIBRARY_PATH includes /usr/local/cuda-8.0/lib64, or, add /usr/local/cuda-8.0/lib64 to /etc/ld.so.conf and run ldconfig as root

To uninstall the CUDA Toolkit, run the uninstall script in /usr/local/cuda-8.0/bin
To uninstall the NVIDIA Driver, run nvidia-uninstall

Please see CUDA_Installation_Guide_Linux.pdf in /usr/local/cuda-8.0/doc/pdf for detailed information on setting up CUDA.

Logfile is /tmp/cuda_install_10793.log

查看NVIDIA设备是否被加载
$ cd /dev/ | grep -i nvidia

加载NVIDIA设备
$ sudo modprobe nvidia

配置环境变量，在```/etc/profile```文件尾部添加以下内容：
$ vi /etc/profile

export CUDA_HOME="/usr/local/cuda-8.0/bin"
export PATH=${CUDA_HOME}:${PATH}

export CUDA_LD_LIBRARY_PATH="/usr/local/cuda-8.0/lib64"
export LD_LIBRARY_PATH=${CUDA_LD_LIBRARY_PATH}:${LD_LIBRARY_PATH}

使以上的配置生效
$ . /etc/profile
```

## 查看CUDA并行计算开发环境是否真的安装成功

**必须**检查CUDA并行计算开发环境是否真的安装成功（被坑过），具体流程如下所示：

```
查看英伟达版本
$ cat /proc/driver/nvidia/version
NVRM version: NVIDIA UNIX x86_64 Kernel Module  375.26  Thu Dec  8 18:36:43 PST 2016
GCC version:  gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4)

查看英伟达CUDA编译器版本
$ nvcc -V
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2016 NVIDIA Corporation
Built on Tue_Jan_10_13:22:03_CST_2017
Cuda compilation tools, release 8.0, V8.0.61

查看GPU驱动信息
$ nvidia-smi
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 375.26                 Driver Version: 375.26                    |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  Tesla K20c          Off  | 0000:82:00.0     Off |                    0 |
| 30%   40C    P0    45W / 225W |      0MiB /  4742MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+
|   1  Tesla K20c          Off  | 0000:83:00.0     Off |                    0 |
| 30%   37C    P0    48W / 225W |      0MiB /  4742MiB |     96%      Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID  Type  Process name                               Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+

查看CUDA常用命令
$ ls /usr/local/cuda/bin/
bin2c        cuda-gdbserver               nsight        nvprune
computeprof  cuda-install-samples-8.0.sh  nvcc          nvvp
crt          cuda-memcheck                nvcc.profile  ptxas
cudafe       cuobjdump                    nvdisasm      uninstall_cuda_8.0.pl
cudafe++     fatbinary                    nvlink
cuda-gdb     gpu-library-advisor          nvprof

恢复界面模式
$ sudo service lightdm start
```

运行CUDA示例，做进一步检查。

特别注意：安装结束后，会产生两份相同的CUDA示例，具体的安装位置分别为：

/root/NVIDIA_CUDA-8.0_Samples （可自定义）

/usr/local/cuda-8.0/samples （系统默认）

```
$ cd NVIDIA_CUDA-8.0_Samples

耗时较长，需耐心等待
$ make

进入执行目录
$ cd bin/x86_64/linux/release

运行CUDA示例deviceQuery
$ ./deviceQuery

./deviceQuery Starting...

 CUDA Device Query (Runtime API) version (CUDART static linking)

Detected 2 CUDA Capable device(s)

Device 0: "Tesla K20c"
  CUDA Driver Version / Runtime Version          8.0 / 8.0
  CUDA Capability Major/Minor version number:    3.5
  Total amount of global memory:                 4742 MBytes (4972412928 bytes)
  (13) Multiprocessors, (192) CUDA Cores/MP:     2496 CUDA Cores
  GPU Max Clock rate:                            706 MHz (0.71 GHz)
  Memory Clock rate:                             2600 Mhz
  Memory Bus Width:                              320-bit
  L2 Cache Size:                                 1310720 bytes
  Maximum Texture Dimension Size (x,y,z)         1D=(65536), 2D=(65536, 65536), 3D=(4096, 4096, 4096)
  Maximum Layered 1D Texture Size, (num) layers  1D=(16384), 2048 layers
  Maximum Layered 2D Texture Size, (num) layers  2D=(16384, 16384), 2048 layers
  Total amount of constant memory:               65536 bytes
  Total amount of shared memory per block:       49152 bytes
  Total number of registers available per block: 65536
  Warp size:                                     32
  Maximum number of threads per multiprocessor:  2048
  Maximum number of threads per block:           1024
  Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
  Max dimension size of a grid size    (x,y,z): (2147483647, 65535, 65535)
  Maximum memory pitch:                          2147483647 bytes
  Texture alignment:                             512 bytes
  Concurrent copy and kernel execution:          Yes with 2 copy engine(s)
  Run time limit on kernels:                     No
  Integrated GPU sharing Host Memory:            No
  Support host page-locked memory mapping:       Yes
  Alignment requirement for Surfaces:            Yes
  Device has ECC support:                        Enabled
  Device supports Unified Addressing (UVA):      Yes
  Device PCI Domain ID / Bus ID / location ID:   0 / 130 / 0
  Compute Mode:
     < Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >

Device 1: "Tesla K20c"
  CUDA Driver Version / Runtime Version          8.0 / 8.0
  CUDA Capability Major/Minor version number:    3.5
  Total amount of global memory:                 4742 MBytes (4972412928 bytes)
  (13) Multiprocessors, (192) CUDA Cores/MP:     2496 CUDA Cores
  GPU Max Clock rate:                            706 MHz (0.71 GHz)
  Memory Clock rate:                             2600 Mhz
  Memory Bus Width:                              320-bit
  L2 Cache Size:                                 1310720 bytes
  Maximum Texture Dimension Size (x,y,z)         1D=(65536), 2D=(65536, 65536), 3D=(4096, 4096, 4096)
  Maximum Layered 1D Texture Size, (num) layers  1D=(16384), 2048 layers
  Maximum Layered 2D Texture Size, (num) layers  2D=(16384, 16384), 2048 layers
  Total amount of constant memory:               65536 bytes
  Total amount of shared memory per block:       49152 bytes
  Total number of registers available per block: 65536
  Warp size:                                     32
  Maximum number of threads per multiprocessor:  2048
  Maximum number of threads per block:           1024
  Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
  Max dimension size of a grid size    (x,y,z): (2147483647, 65535, 65535)
  Maximum memory pitch:                          2147483647 bytes
  Texture alignment:                             512 bytes
  Concurrent copy and kernel execution:          Yes with 2 copy engine(s)
  Run time limit on kernels:                     No
  Integrated GPU sharing Host Memory:            No
  Support host page-locked memory mapping:       Yes
  Alignment requirement for Surfaces:            Yes
  Device has ECC support:                        Enabled
  Device supports Unified Addressing (UVA):      Yes
  Device PCI Domain ID / Bus ID / location ID:   0 / 131 / 0
  Compute Mode:
     < Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >
> Peer access from Tesla K20c (GPU0) -> Tesla K20c (GPU1) : Yes
> Peer access from Tesla K20c (GPU1) -> Tesla K20c (GPU0) : Yes

deviceQuery, CUDA Driver = CUDART, CUDA Driver Version = 8.0, CUDA Runtime Version = 8.0, NumDevs = 2, Device0 = Tesla K20c, Device1 = Tesla K20c
Result = PASS （运行成功标识）

运行CUDA示例bandwidthTest
$ ./bandwidthTest

[CUDA Bandwidth Test] - Starting...
Running on...

 Device 0: Tesla K20c
 Quick Mode

 Host to Device Bandwidth, 1 Device(s)
 PINNED Memory Transfers
   Transfer Size (Bytes)        Bandwidth(MB/s)
   33554432                     6038.7

 Device to Host Bandwidth, 1 Device(s)
 PINNED Memory Transfers
   Transfer Size (Bytes)        Bandwidth(MB/s)
   33554432                     6553.5

 Device to Device Bandwidth, 1 Device(s)
 PINNED Memory Transfers
   Transfer Size (Bytes)        Bandwidth(MB/s)
   33554432                     146996.4

Result = PASS （运行成功标识）

NOTE: The CUDA Samples are not meant for performance measurements. Results may vary when GPU Boost is enabled.
```

# 解决由于Linux内核升级导致GPU无法使用问题

默认情况下，Ubuntu 16.04会升级Linux内核。

Linux内核的升级会导致英伟达驱动程序（NVIDIA Driver）无法运行。

具体表现为：

```
$ nvidia-smi
NVIDIA-SMI has failed because it couldn't communicate with the NVIDIA driver. 
Make sure that the latest NVIDIA driver is installed and running.
```

需要先卸载英伟达驱动程序与CUDA安装程序。

```
卸载英伟达驱动程序
$ sudo /usr/bin/nvidia-uninstall
$ sudo apt-get --purge remove nvidia-*

卸载CUDA Toolkit安装程序（模板）
$ sudo /usr/local/cuda-X.Y/bin/uninstall_cuda_X.Y.pl

$ sudo /usr/local/cuda-8.0/bin/uninstall_cuda_8.0.pl
```

再根据以上的安装指南，重新安装即可。

## 参考资料

[NeuroSurfer提供的CUDA安装方案](https://devtalk.nvidia.com/default/topic/878117/cuda-setup-and-installation/-solved-titan-x-for-cuda-7-5-login-loop-error-ubuntu-14-04-/1)

* ************************************************* *
DQQ077 (段琦琦) [duanqq@mail.sustc.edu.cn || duanqq077@qq.com]，SUSTC-CS-OPAL

2017-04-26 21:00:00

2017-04-27 21:00:00

2017-06-11 14:00:00
* ************************************************* *
