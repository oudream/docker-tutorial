### 操作系统


### 参考
[Unix domain socket or IPC socket - wiki](https://en.wikipedia.org/wiki/Unix_domain_socket)  
[Unix域套接字 - 维基](https://zh.wikipedia.org/wiki/Unix%E5%9F%9F%E5%A5%97%E6%8E%A5%E5%AD%97)  
[localhost-127.0.0.1 - 维基](https://zh.wikipedia.org/wiki/Localhost)  
[0.0.0.0 - 维基](https://en.wikipedia.org/wiki/0.0.0.0)  
[Device file - wiki](https://en.wikipedia.org/wiki/Device_file)  
[设备文件系统 - 维基](https://zh.wikipedia.org/wiki/%E8%AE%BE%E5%A4%87%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F)  
[Network socket - wiki](https://en.wikipedia.org/wiki/Network_socket)  
[原始套接字(Raw_socket) - 维基](https://zh.wikipedia.org/wiki/%E5%8E%9F%E5%A7%8B%E5%A5%97%E6%8E%A5%E5%AD%97)  
[Berkeley Sockets - wiki](https://en.wikipedia.org/wiki/Berkeley_sockets)  
[Berkeley套接字 - 维基](https://zh.wikipedia.org/wiki/Berkeley%E5%A5%97%E6%8E%A5%E5%AD%97)    
[Linux C编程一站式学习](https://akaedu.github.io/book/index.html)  

### 
![](res/Simplified_Structure_of_the_Linux_Kernel.svg)


### Unix域套接字
- Unix域套接字或IPC套接字（进程间通信套接字）是用于在同一主机操作系统上执行的进程之间交换数据的数据通信端点。 
- UNIX域中的有效套接字类型为：
    - SOCK_STREAM（与TCP相比）–用于面向流的套接字 
    - SOCK_DGRAM（与UDP比较）–对于保留消息边界的面向数据报的套接字（与大多数UNIX实现一样，UNIX域数据报套接字始终可靠，并且不对数据报进行重新排序） 
    - SOCK_SEQPACKET（与SCTP相比）–用于面向连接，保留消息边界并按消息发送顺序传递消息的顺序数据包套接字 
- Unix域套接字工具是POSIX操作系统的标准组件。
- Unix域套接字的API与Internet套接字的API相似，但是所有通信都完全在操作系统内核内进行，而不是使用基础网络协议。 
- Unix域套接字可以使用文件系统作为其地址名称空间。 （某些操作系统，例如Linux，提供了额外的命名空间。）
- 进程将Unix域套接字引用为文件系统inode，因此两个进程可以通过打开相同的套接字进行通信。 
- 除了发送数据之外，进程还可以使用sendmsg（）和recvmsg（）系统调用通过Unix域套接字连接发送文件描述符。
- 这允许发送进程授予接收进程对文件描述符的访问权限，否则接收进程将无法访问该文件描述符。
- 这可以用来实现基于能力的安全性的基本形式。例如，这允许Clam AntiVirus扫描程序在Linux和BSD上作为无特权的守护程序运行，但仍可以读取发送到该守护程序的Unix域套接字的任何文件。  

[UNIX Domain Socket IPC 样例（C语言）](https://akaedu.github.io/book/ch37s04.html)


