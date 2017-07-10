# 在CentOS 7操作系统下使用phoronix-test-suite进行性能测试

关于phoronix-test-suite的基本信息，请参阅：

[phoronix-test-suite官方网址](http://www.phoronix-test-suite.com/)

[phoronix-test-suite用户指南](http://www.phoronix-test-suite.com/documentation/phoronix-test-suite.pdf)

## 安装phoronix-test-suite软件包

```
# sudo yum install php-cli php-xml
需先安装phoronix-test-suite所依赖的软件包。

# sudo ./install-sh
运行以上SHELL命令，输出以下信息：
Phoronix Test Suite Installation Completed

Executable File: /usr/bin/phoronix-test-suite
Documentation: /usr/share/doc/phoronix-test-suite/
Phoronix Test Suite Files: /usr/share/phoronix-test-suite/
```

## 获取系统基本信息，如处理器、显卡、主板、硬盘与操作系统等

```
# phoronix-test-suite system-info
运行以上SHELL命令，输出以下信息：
System Information

  PROCESSOR:          2 x Intel Xeon E5-2640 v4 @ 3.40GHz (40 Cores)
    Core Count:       10
    Thread Count:     40
    Extensions:       SSE 4.2 + AVX2 + AVX + RDRAND + FSGSBASE
    Cache Size:       25600 KB
    Microcode:        0xb00001f
    Scaling Driver:   intel_pstate powersave
    
  GRAPHICS:           Matrox s G200eR2
    Monitor:          LT2252 Wide
    Screen:           1680x1050

  MOTHERBOARD:        Dell 072T6D
    Memory:           64512MB
    Chipset:          Intel Xeon E7 v4/Xeon
    Network:          Broadcom Limited NetXtreme BCM5720 Gigabit PCIe

  DISK:               4 x 480GB SAMSUNG MZ7WD480
    File-System:      xfs
    Mount Options:    attr2 inode64 noquota relatime rw seclabel
    Disk Scheduler:   DEADLINE

  OPERATING SYSTEM:   CentOS Linux 7
    Kernel:           3.10.0-514.21.2.el7.x86_64 (x86_64)
    Compiler:         GCC 4.8.5 20150623
 ```
 
 ## 列举可供使用的性能测试集
 
```
# phoronix-test-suite list-tests
# phoronix-test-suite list-available-tests

# phoronix-test-suite list-recommended-tests
运行以上SHELL命令，输出以下推荐使用的性能测试集：
Phoronix Test Suite v7.2.1
Recommended OpenBenchmarking.org Test Profiles

Graphics Tests

pts/xonotic-1.5.0                - Xonotic                
pts/etlegacy-1.0.0               - ET: Legacy             
pts/openarena-1.5.3              - OpenArena              
pts/gputest-1.3.1                - GpuTest                
pts/bioshock-infinite-1.0.1      - BioShock Infinite      
pts/apitest-1.1.0                - APITest                
pts/cairo-demos-1.0.1            - Cairo Performance Demos

System Tests

pts/apache-1.6.1                 - Apache Benchmark       
pts/phpbench-1.1.1               - PHPBench               
pts/phpbench-1.1.0               - PHPBench               
system/darktable-1.0.0           - Darktable              
pts/battery-power-usage-1.0.0    - Battery Power Usage    
pts/nginx-1.1.0                  - NGINX Benchmark        
pts/pybench-1.0.0                - PyBench                

Processor Tests

pts/c-ray-1.1.0                  - C-Ray                  
pts/cachebench-1.1.0             - CacheBench             
pts/build-linux-kernel-1.7.0     - Timed Linux Kernel Compilation
pts/compress-7zip-1.6.2          - 7-Zip Compression      
pts/compress-gzip-1.1.0          - Gzip Compression       
pts/crafty-1.3.1                 - Crafty                 
pts/scimark2-1.2.1               - SciMark                

Disk Tests

pts/aio-stress-1.1.1             - AIO-Stress             
pts/unpack-linux-1.0.0           - Unpacking The Linux Kernel
pts/hdparm-read-1.0.0            - hdparm Timed Disk Reads
pts/fio-1.8.2                    - Flexible IO Tester     
pts/fio-1.9.0                    - Flexible IO Tester     
pts/aio-stress-1.1.0             - AIO-Stress             
pts/tiobench-1.1.0               - Threaded I/O Tester    

Memory Tests

pts/stream-1.3.1                 - Stream                 
pts/ramspeed-1.4.0               - RAMspeed SMP           
pts/stream-1.2.0                 - Stream                 
pts/t-test1-1.0.0                - t-test1                
pts/stream-1.1.0                 - Stream                 
pts/stream-1.3.0                 - Stream                 

Network Tests

pts/network-loopback-1.0.1       - Loopback TCP Network Performance
pts/network-loopback-1.0.0       - Loopback TCP Network Performance
```

## 获取性能测试集的明细信息

```
# phoronix-test-suite info c-ray
运行以上SHELL命令，输出以下信息：
Phoronix Test Suite v7.2.1
C-Ray 1.1

Run Identifier:      pts/c-ray-1.1.0
Profile Version:     1.1.0
Maintainer:          Michael Larabel
Test Type:           Processor
Software Type:       Utility
License Type:        Free
Test Status:         Verified
Project Web-Site:    http://www.futuretech.blinkenlights.nl/c-ray.html
Estimated Run-Time:  339 Seconds
Download Size:       0.22 MB
Environment Size:    6.0 MB

Description: This is a test of C-Ray, a simple raytracer designed to test the floating-point CPU performance. 
This test is multi-threaded (16 threads per core), will shoot 8 rays per pixel for anti-aliasing, 
and will generate a 1600 x 1200 image.

Test Installed: No

Software Dependencies:
- Compiler / Development Libraries
```

## 运行具体的性能测试集并将测试结果上传到openbenchmarking.org

[openbenchmarking官方网址](http://openbenchmarking.org/)

```
# phoronix-test-suite benchmark c-ray
运行以上SHELL命令，输出以下信息：
Phoronix Test Suite v7.2.1

    To Install:    pts/c-ray-1.1.0

    Determining File Requirements ..........................................
    Searching Download Caches ..............................................

    1 Test To Install
        1 File To Download [0.22MB]
        6MB Of Disk Space Is Needed

    pts/c-ray-1.1.0:
        Test Installation 1 of 1
        1 File Needed [0.22 MB]
        Downloading: c-ray-1.1.tar.gz                               [0.22MB]
        Downloading ........................................................
        Installation Size: 6.0 MB
        Installing Test @ 06:22:59

    Would you like to save these test results (Y/n): y
    Enter a name to save these results under: cray2
    Enter a unique name to describe this test run / configuration: cray2

If desired, enter a new description below to better describe this result set / system configuration under test.
Press ENTER to proceed without changes.

Current Description: 2 x Intel Xeon E5-2640 v4 testing with a Dell 072T6D and Matrox s G200eR2 on CentOS Linux 7 
via the Phoronix Test Suite.

New Description:

C-Ray 1.1:
    pts/c-ray-1.1.0
    Test 1 of 1
    Estimated Trial Run Count:    3
    Estimated Time To Completion: 6 Minutes [06:29 CDT]
        Started Run 1 @ 06:23:47
        Started Run 2 @ 06:23:55
        Started Run 3 @ 06:24:03

    Total Time:
        6.552
        6.539
        6.533

    Average: 6.54 Seconds
    Deviation: 0.15%

    Do you want to view the text results of the testing (Y/n): y

C-Ray 1.1
Total Time
  Seconds
    cray2 .. 6.54 |============================================================

    Would you like to upload the results to OpenBenchmarking.org (Y/n): y
    Would you like to attach the system logs (lspci, dmesg, lsusb, etc) to the test result (Y/n): y

Results Uploaded To: http://openbenchmarking.org/result/1707107-TR-CRAY2668586
```

## phoronix-test-suite测试分析数据输出位置解析

```
# cd ~/.phoronix-test-suite/
core.pt2so         modules-data          test-suites
download-cache     openbenchmarking.org  user-config.xml
graph-config.json  temp.pt2so            xsl
installed-tests    test-profiles
modules            test-results
```

根据以上的文件和文件夹名称，基本可以推断出各自的作用与目的。例如，```test-results```用来存储最终的测试结果。

## 本人已完成的性能测试实验列表

http://openbenchmarking.org/result/1707104-TR-CRAY0193869

http://openbenchmarking.org/result/1707107-TR-CRAY2668586

http://openbenchmarking.org/result/1707102-TR-DQQCACHEB61

http://openbenchmarking.org/result/1707108-TR-TESTNUMPY60

http://openbenchmarking.org/result/1707108-TR-NUMPYDQQ472
