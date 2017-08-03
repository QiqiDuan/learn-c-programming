# 分析MATLAB程序的时间性能

一般情况下，使用```tic```与```toc```，即可较为精确地测量MATLAB程序的时间性能（相对于```etime```而言）。

特别需要注意的是：在```for```循环嵌套结构中，可使用```tic```与```toc```，分析子程序（或函数）的时间性能。

## 参考资料

https://www.mathworks.com/company/newsletters/articles/improvements-to-tic-and-toc-functions-for-measuring-absolute-elapsed-time-performance-in-matlab.html
