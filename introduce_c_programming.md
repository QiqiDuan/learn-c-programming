# C语言编程简介

## C语言编程常用标准汇总

标准（standard） ~~ 可移植性（portability）

C语言标准名称 | GCC编译选项
------------ | ----------
ANSI C | -ansi
ISO C |
POSIX C |
GNU C |

## C语言编程变量与函数命名

[与C语言标准库相关的保留字](https://www.gnu.org/software/libc/manual/html_node/Reserved-Names.html)

## C语言编程头文件使用说明

[头文件](https://gcc.gnu.org/onlinedocs/cpp/Header-Files.html)主要用于：1）定义数据类型、宏；2）声明变量、函数。

```C
#include <header-file>    // 用于包含系统标准库
#include "header-file"    // 用于包含自定义程序

/*
 * once only header
 *    controlling-macro == guard-macro
 */
#ifndef controlling-macro
#define controlling-macro

#endif /* !controlling-macro */
```

头文件编程风格：

```C
    * 应该显式声明头文件，即使有些头文件会包含其他头文件。
    * 使用“/”作为路径分隔符，以获取最大的程序可移植性。
    * 对于系统标准头文件来说，controlling-macro应该以“_”为首字母；
    * 对于用户自定义头文件来说，controlling-macro不应该以“_”为首字母。
```

## C语言编程错误处理机制

[C语言标准库<errno.h>错误代码汇总](https://www.gnu.org/software/libc/manual/html_node/Error-Codes.html)

常见的错误代码 | 中文解释
------------- | -------
ENOMEM | 没有足够内存可用
EINVAL | 非法参数
EDOM | 区间错误（数学函数）
ERANGE | 范围错误（数学函数）

## C语言编程经典参考资料

[The GNU C Library](https://www.gnu.org/software/libc/manual/html_node/)