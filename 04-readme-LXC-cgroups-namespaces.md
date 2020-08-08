# 2 Docker 原理

## 2.1 Docker

- Docker = Container?

### 2.1.1 简介

​	**Docker**是一个开源工具，可以将我们的应用打包成一个标准格式的镜像，并且以容器(Container)的方式运行。

### 2.1.2 容器

​	**容器是什么？**容器是一个让我们能对某个应用和应用整个运行时环境一起进行打包或者隔离的技术。让我们能够在不用的环境之间轻松的迁移应用的同时，能保留应用的全部功能。  
​	**容器能做什么？**假定，我们在使用一台电脑进行开发，然后，我的开发环境在我电脑上是配置完成的，而我的小伙伴和我同时也要协同工作，但是，他的开发环境和我的不大一样。我当前的开发是依赖于我电脑上的某些特定文件，这些文件小伙伴是没有的，但是，我想让我的开发应用能在小伙伴的电脑上能不出问题的成功部署，这是时候，我就可以使用容器。
容器能确保应用拥有必须的配置和文件，使得应用能够在从开发到测试再到生产的整个流程中能够顺利运行
如下图就是一个容器的架构图：
![container](https://docs.docker.com/engine/images/architecture.svg)

### 2.1.3 容器与虚拟机

**容器和虚拟化的区别是什么**我们来回顾一下虚拟机:

- 虚拟机让许多的操作系统能够同时在单个系统上运行。
- 虚拟机是需要模拟整台机器包括硬件，每台虚拟机都要有自己的操作系统，一旦被开启，预分配的资源将被全部占用。
- 虚拟机包括应用，必要的二进制和库，以及一个完整的用户操作系统

看下面的图片是虚拟化和容器的系统架构区别：
![virtual&container](https://i.imgur.com/IqiGyoJ.png)
​         可以看到虚拟化的实现是基于Hypervisor(VMM,virtual machine monitor)的，我们的操作系统使用Hypervisor来建立与执行虚拟机器的软件、硬件。
而容器呢，是基于文件系统的，它并没有模拟一个完整的操作系统，而是对进程进行隔离，它能达成更加轻量化的效果。

### 2.1.4 Docker与容器

我们知道，Docker是一项容器化技术，用于支持创建和使用Linux容器。
Docker技术，使用Linux内核功能(如：Namespace、Cgroups、Union File System)来分离进程,以便于各进程相互独立运行。这种独立性就是我们想使用Docker的原因，使用Docker,我们可以独立运行多种进程，多个应用程序，更加从分的发挥基础设施的作用，同时保持各个独立系统的安全性。
容器工具(Docker)提供基于镜像的部署模式，使得我们能够轻松的跨多种环境，并且能够自动部署应用程序。

Docker首先是基于lxc技术构建的，但是，现在它在lxc技术上扩展了许多其他功能，下图是lxc和Docker的对比：
![Lxc&Docker](https://digitize01.com/image/image_lib/images/traditional-linux-containers-vs-docker.png)

### 2.1.5 为什么使用Docker

- 模块化
  Docker能单独截取部分应用程序进行更新或者修复

- 层和镜像版本控制
  每个Docker都包含多个层。这些层组合在一起，构成单个镜像。每当镜像发生改变时，一个新的镜像层即被创建出来。用户每次发出命令（例如 *run* 或 *copy*）时，都会创建一个新的镜像层。

- 回滚

  每个镜像都拥有多个层。比如说，如果你不喜欢迭代后的镜像版本？完全可以通过回滚，返回之前的版本。

- 快速部署

  基于 Docker 的容器可将部署时间缩短到几秒。通过为每个进程构建容器，您可以快速将这些类似进程应用到新的应用程序中。而且，由于无需启动操作系统即可添加或移动容器，因此大幅缩短了部署时间。除此之外，得益于这种部署速度，您可以轻松无虞、经济高效地创建和销毁容器创建的数据。

## 2.2 Docker技术

Dockers采用了C/S 架构，包括客户端和服务端。Docker守护进程(Daemon)作为服务端来接收来自客户端的请求，并处理这些请求（创建、运行、分发容器）。

客户端和服务端既可以运行在一个机器上，也可以通过RESTful 、socket或者网络接口与远程Docker服务器端进行通信。

### 2.2.1 Linux Namespace

命名空间是Linux Kernel的一个功能，他可以隔离一系列的系统资源，比如PID（Process ID)、User ID、NetWork等等。

每个容器都有自己单独的命名空间，运行在其中的应用都像是在妒忌的操作系统中运行一样。命名空间保证了容器之间比起互不影响。

- pid Namespace

  **PID Namespace** 就是用来隔离进程ID的。一个进程在不同的PID Namespace里可以拥有不同的PID。

- net Namespace

  **Netwoek Namespace** 用来隔离网络设备、IP地址端口等网络栈的Namespace。

- ipc Namespace

  **IPC(,interprocess communication,进程间交互方法) Namespace** 用来隔离 System V IPC 和 POSIX message queues。每一个IPC Namespace 都有自己的 System V IPC 和 POSIX message queue。容器的进程间交互实际上还是 host 上具有相同 pid 命名空间中的进程间交互

- mnt Namespace

  **Mount Namespace** 用来隔离各个进程看到的挂载点视图。在不同的Namespace里，能看到的文件系统层次是不一样的。

- uts Namespace

  **UTS Namespace** 用来隔离nodename和domainname两个系统标识。在 UTS Namespace里，每一个Namespace允许自己有自己的hostname。使其在网络上可以被视作一个独立的节点而非 主机上的一个进程。

- user Namespace

  **User Namespace** 主要是用来隔离用户的用户组ID。一个进程的User ID  和  Group ID 在User Namespace内外可以是不同的。

### 2.2.2 Linux Cgroups

Linux Cgroups 技术能够限制每个空间的大小，保证他们之间不会互相争抢。

**什么是Linux Cgroups?** Linux Cgroups(Linux Control Groups)提供了对一组进程以及将来的子进程的资源限制、控制和统计的能力，这些资源包括CPU、内存、存储、网络等等，通过Cgroups，能够方便的控制分配到容器的资源，避免当多个容器同时运行时的对系统资源的竞争。

Cgroups 的3个组件：

- **cgroup**

  cgroup是对进程分组管理的一种机制，一个cgroup包含了一组进程，并且可以在这个cgroup上增加Linux subsystem的各种参数配置，将一组进程和一组subsystem的系统参数关联起来。

- **subsystem**

  subsystem是一组资源控制的模块，一般包含以下几项：

  - **blkio** 设置对块设备（比如硬盘）的输入输出访问控制

  - **cpu**设置cgroup中进程的CPU调度策略

  - **cpuacct**统计cgroup中的CPU占用

  - **cpuset** 在多核机器上设置cgroup中进程可以使用的CPU和内存

  - **devices** 控制cgroup中进程对设备的访问

  - **freezer**用于挂起(suspend)和恢复(resume)cgroup中的进程

  - **memory**用于控制cgroup中进程的内存占用

  - **net_cls**用于将cgroup中进程产生的网络包分类，以便Linux的tc（traffic controller）可以根据分类区分出来自某一个cgroup的包，并作限流或者监控。

  - **net_prio**设置cgroup中进程产生的网络流量的优先级

  - **ns**作用是使cgroup中的进程在新的Namespace中fork新进程时，创建出一个新的cgroup，这个cgroup包含新的Namespace中的进程。

    每一个subsystem会关联定义了相应限制的cgroup上，并对这个cgroup中的进程做相应的限制和控制，这些subsystem是逐步合并到内核当中的。

- **hierarchy**

  hierarchy是吧一组cgroup串成一个树状的结构，一个这样的树就是一个hierarchy，通过这个树结构，Cgroup能做到继承。

- **三个组件之间的关系**

  Cgroup是通过这三个组件之间的相互协作实现的。

  - 系统首先会创建新的hierarchy，在这之后，系统中所有的进程会加入到这个hierarchy的根节点，这个根节点是hierchy默认创建的。
  - 一个subsystem只能附加到一个hierarchy上
  - 一个hierarchy上能够附加多个subsystem
  - 一个进程可以最为多个cgroup的成员，但是这些cgroup必须在不同的hierarchy中。
  - 一个进程fork出子进程时，子进程和父进程是在同一个cgroup中的，我们也可以根据需要将其移动到其他的cgroup中。

### 2.2.3 Linux File system

**什么是Union File system?**

Union File System是一种为Linux、FreeBSD、和NetBSD操作系统设计的，把其他文件系统联合到一个联合挂载点的文件系统服务。

它使用branch把不同文件系统的文件和目录透明地覆盖，这些branch要么是read-only的，要呢是read-write的。

**AUFS**

AUFS（Advanced Multi-Layered Unification Filesystem），它是Docker选用的第一种存储驱动，AUFS具有快速启动容器，高效利用存储和内存的优点。迄今为止，AUFS仍然是Docker支持的一种存储类型。

# 3 针对Docker原理的学习

## 3.1 Linux Namespace 

​	Namespace是Linux Kernel的一个功能，他可以隔离一系列的系统资源，比如PID（Process ID)、User ID、NetWork等等。每个容器都有自己单独的命名空间，运行在其中的应用都像是在独立的操作系统中运行一样。命名空间保证了容器之间比起互不影响。

​	当前Linux一共实现了6种不同类型的Namespace。

|   Namespace类型   | 系统调用参数  | 内核版本 |
| :---------------: | :-----------: | :------: |
|  Mount Namespace  |  CLONE_NEWNS  |  2.4.19  |
|   UTS Namespace   | CLONE_NEWUTS  |  2.6.19  |
|   IPC Namespace   | CLONE_NEWIPC  |  2.6.19  |
|   PID Namespace   | CLONE_NEWPID  |  2.6.24  |
| Network Namespace | CLONE_NEWNET  |  2.6.29  |
|  User Namespace   | CLONE_NEWUSER |   3.8    |

### 3.1.1 UTS Namespace

在UTS namespace里面，每个Namespace都允许拥有自己的hostname。

hostname 是用于显示和设置系统的主机名称的。环境变量HOSTNAME也保存了当前的主机名。在使用hostname命令设置主机名后，系统并不会永久保存新的主机名，重新启动机器之后还是原来的主机名。

```go
package main

import (
	"log"
	"os"
	"os/exec"
	"syscall"
)

func main(){
    // 指定被fork出来的新进程的初始命令，默认使用sh来执行
	cmd := exec.Command("sh")
    // 设置系统调用参数，根据上面表中所述，使用CLONE_NEWNS这个标识符去创建一个UTSNamespace.
	cmd.SysProcAttr = &syscall.SysProcAttr{
		Cloneflags: syscall.CLONE_NEWUTS,
	}

	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	if err:= cmd.Run(); err != nil {
		log.Fatal(err)
	}
}
```

执行代码，进入一个sh环境，

```sh
pstree -pl
# 得到以下输出
|bash(3266)--go(3277)--main(3299)--sh(3304)-pstree(3305)

# 查看当前PID
echo $$
3304

# 验证父进程在不同的UTS namespace中
readlink /proc/3299/ns/uts
# uts:[4026531838]
readlink /proc/3304/ns/uts
# uts:[4026532448]
```

​	可以看到，`main`和`sh`不在同一个uts namespace中，由于uts对Namespace做了隔离。下载做一个测试

```sh
# 在本sh环境中，做如下测试
# 修改hostname为bird然后打印出来
hostname -b bird
hostname
# 输出:bird
# 在外部shell 中运行hostname
# 输出：ubuntu
```

### 3.1.2 IPC  Namespace

​	用来隔离System V IPC 和 POSIX message queues。

- System V IPC 系统进程间通信。提供了三种方法

  - 消息队列

    消息队列允许一个应用程序提交消息，其他应用程序可以在以后获得该消息，甚至是在发送应用程序已结束之后。

  - 信号量

    信号量确保多个应用程序可以锁定资源并避免争用条件。

  - 共享内存

    共享内存允许多个应用程序共享一个公共内存段，从而提供了一种传递和共享大量数据的快速方法。

- POSIX message queues 也是Linux进程通信的消息队列的一种。在不同进程间发送特定格式的消息数据

```sh
# 在宿主机上打开一个shell
# 查看现有的ipc Message Queues
ipcs -q
# 输出如下：
# ------ Message Queues --------
# key        msqid      owner      perms      used-bytes   messages  
# 创建一个message queue
ipcmk -Q
# Message queue id: 0
# 再查看
# ------ Message Queues --------
# key        msqid      owner      perms      used-bytes   messages    
# 0x160d6adb 0          root       644        0            0          
```

可以看到，现在已经有一个消息队列了，现在在另外一个shell里面，运行代码：

```go
package main

import (
	"log"
	"os"
	"os/exec"
	"syscall"
)

func main(){
    // 指定被fork出来的新进程的初始命令，默认使用sh来执行
	cmd := exec.Command("sh")
    // 修改一下这位置，添加一个系统调用CLONE_IPC
	cmd.SysProcAttr = &syscall.SysProcAttr{
		Cloneflags: syscall.CLONE_NEWUTS|syscall.CLONE_NEWIPC,
	}

	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	if err:= cmd.Run(); err != nil {
		log.Fatal(err)
	}
}
```

```sh
# 在新的sh里面，查看队列
ipcs -q
# ------ Message Queues --------
# key        msqid      owner      perms      used-bytes   messages 
```

在新的Namespace里，看不到宿主机上已经创建了message queue，说明了IPC已经隔离了。

### 3.1.3 PID Namespace

​	PID Namespace很显然就是用来隔离进程ID的，在不同的PID Namespace里可以拥有不同的PID。

同样修改一下上面的代码：

```go
package main

import (
	"log"
	"os"
	"os/exec"
	"syscall"
)

func main(){
    // 指定被fork出来的新进程的初始命令，默认使用sh来执行
	cmd := exec.Command("sh")
    // 设置系统调用参数，例如，使用CLONE_NEWNS这个标识符去创建一个UTSNamespace.
	cmd.SysProcAttr = &syscall.SysProcAttr{
		Cloneflags: syscall.CLONE_NEWUTS|syscall.CLONE_NEWIPC|
  syscall.CLONE_NEWPID|syscall.CLONE_NEWPNS|syscall.CLONE_NEWPUSER|
        syscall.CLONE_NEWNET,
	}

	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	if err:= cmd.Run(); err != nil {
		log.Fatal(err)
	}
}
```

两个shell，查看PID

```sh
# 一个sh查看修改前
pstree -pl
# |bash(3266)-go(3621)-main(3643)-sh(3648)

# 一个查看修改后
echo $$
# 1
```

打印当前Namespace的PID 可以看到，是1。也就是说从外部的main(3643)被映射到Namespace后的PID1。

### 3.1.4 Mount Namespace

​	Mount 用来隔离挂载点视图。在不同的Namespace中，我们看到的文件系统层次是不一样的。在Namespace中，调用mount()和unmount()仅仅只会影响当前的Namespace内的文件系统。对于全局的文件系统则是没有影响的。

两个shell

```sh
# 一个sh修改前,查看内核和内核模块
ls /proc
1     127   1510  1709  199   225   252   2779  292   3084  3407  42   53   82    buddyinfo      mounts
10    128   1519  171   2     226   253   278   2920  3088  3408  420  54   827   bus            mpt
100   1283  152   172   20    227   254   2783  2921  3092  341   421  55   83    cgroups        mtrr
101   129   1529  173   200   228   255   2785  2927  31    342   422  56   84    cmdline        net
102   1291  153   174   201   229   256   2786  2928  3112  3428  423  57   85    consoles       pagetypeinfo
103   13    1530  175   202   23    257   2788  293   3119  343   424  58   86    cpuinfo        partitions
104   130   1533  176   203   230   258   279   2930  3124  3470  425  59   861   crypto         sched_debug
105   131   154   177   204   231   259   2793  2934  3129  35    426  60   87    devices        schedstat
106   132   155   178   205   232   26    2797  2936  315   3531  427  61   88    diskstats      scsi
107   133   156   179   206   233   260   28    294   3154  36    428  62   883   dma            self
108   134   157   1791  207   234   261   2806  2945  316   3695  429  63   889   driver         slabinfo
109   135   158   18    208   2348  262   281   295   3162  37    43   64   89    execdomains    softirqs
11    136   1581  180   209   235   2627  2810  2957  3167  38    430  65   894   fb             stat
110   1362  159   181   21    236   263   282   2961  3172  39    431  66   9     filesystems    swaps
111   137   1597  182   210   237   264   2821  297   3178  399   432  67   90    fs             sys
112   1373  16    183   211   2372  2649  2824  298   318   4     433  68   900   interrupts     sysrq-trigger
113   1374  160   184   212   238   265   2826  2982  3182  40    434  687  91    iomem          sysvipc
114   138   1607  185   213   239   2651  283   299   319   400   435  69   910   ioports        timer_list
115   139   161   186   2134  24    266   2830  2995  32    405   436  692  92    ipmi           timer_stats
116   14    162   187   214   240   267   2837  3     3224  407   44   7    93    irq            tty
117   140   163   188   215   241   268   284   30    3240  408   45   70   94    kallsyms       uptime
118   141   1633  189   216   242   269   2840  300   3247  409   46   71   948   kcore          version
1186  142   164   19    217   243   27    2847  3005  3248  41    465  72   949   key-users      version_signature
119   143   1645  190   2171  244   270   285   301   3264  410   47   73   95    kmsg           vmallocinfo
12    144   165   191   218   2442  271   2850  302   3265  411   48   74   950   kpagecount     vmstat
120   145   166   192   2183  245   272   286   3027  3266  412   480  75   951   kpageflags     zoneinfo
121   146   1669  1926  219   246   273   287   303   3276  413   481  76   952   latency_stats
122   147   167   193   22    247   2739  288   3045  33    414   49   77   953   loadavg
123   148   1672  194   220   248   274   289   3059  3306  415   5    78   96    locks
124   149   168   195   221   249   2750  29    3060  3355  416   50   79   97    mdstat
125   15    169   196   222   25    2759  290   3062  3394  417   51   8    98    meminfo
126   150   17    197   223   250   276   291   3071  34    418   513  80   99    misc
1268  151   170   198   224   251   277   2917  3072  3406  419   52   81   acpi  modules

# 看不懂的内核模块调用信息

# 运行代码后的模块
mount -t proc proc /proc
ls /proc
1	   consoles   execdomains  ipmi        kpageflags     modules	    sched_debug  swaps		uptime
3	   cpuinfo    fb	   irq	       latency_stats  mounts	    schedstat	 sys		version
acpi	   crypto     filesystems  kallsyms    loadavg	      mpt	    scsi	 sysrq-trigger	version_signature
buddyinfo  devices    fs	   kcore       locks	      mtrr	    self	 sysvipc	vmallocinfo
bus	   diskstats  interrupts   key-users   mdstat	      net	    slabinfo	 timer_list	vmstat
cgroups    dma	      iomem	   kmsg        meminfo	      pagetypeinfo  softirqs	 timer_stats	zoneinfo
cmdline    driver     ioports	   kpagecount  misc	      partitions    stat	 tty
# 还是看不懂，但是少了好多文件。
# 查看下系统进程
ps -ef
UID         PID   PPID  C STIME TTY          TIME CMD
root          1      0  0 22:46 pts/0    00:00:00 sh
root          4      1  0 22:48 pts/0    00:00:00 ps -ef
```

可以看到，在当前的namespace中，sh进程是PID为1的进程，说明的是，当前的Mount Namespace和外部的空间是隔离的。

### 3.1.5 User Namespace

​	隔离用户组ID。简单的例子是，一个用户在外部没有root权限，在Namespace内部有。代码：

```go

```

```sh
# 外部
id
# uid=0(root) gid=0(root) groups=0(root)

# 内部
id
# uid=65534(nobody) gid=65534(nogroup) groups=65534(nogroup)
```

可以看到，UID 不同。

### 3.1.6 Network Namespace

隔离网络设备、IP地址端口等网络栈的Namespace。

```sh
# 外部
ifconfig
eth0      Link encap:Ethernet  HWaddr 00:0c:29:5d:4b:57  
          inet addr:192.168.183.132  Bcast:192.168.183.255  Mask:255.255.255.0
          inet6 addr: fe80::20c:29ff:fe5d:4b57/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1607 errors:0 dropped:0 overruns:0 frame:0
          TX packets:264 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:186974 (186.9 KB)  TX bytes:32795 (32.7 KB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:54 errors:0 dropped:0 overruns:0 frame:0
          TX packets:54 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:4745 (4.7 KB)  TX bytes:4745 (4.7 KB)

# 内部
ifconfig
# 什么都没有输出
```

可以看到，Namespace里面什么都灭有。断定处于隔离状态了。

## 3.2 Linux Cgroups

 	Linux Cgroups(LInux Control Groups)提供了对一组进程以及将来的子进程的资源限制、控制和统计的能力，这些资源包括CPU、内存、存储、网络等等，通过Cgroups，能够方便的控制分配到容器的资源，避免当多个容器同时运行时的对系统资源的竞争。

三个组件

- cgroup

  对进程分组管理的一种机制，一个cgroup包含了一组进程，并且可以在这个cgroup上增加Linux subsystem的各种参数配置，将一组进程和一组subsystem的系统参数关联起来。

- subsystem

```sh
lssubys -a
# 可以看到Lernel支持的subsystem
cpuset       # 在多核机器上设置cgroup中进程可以使用的CPU和内存
cpu          # 设置cgroup中进程的CPU调度策略
cpuacct      # 统计cgroup中的CPU占用
memory       # 用于控制cgroup中进程的内存占用
devices      # 控制cgroup中进程对设备的访问
freezer      # 用于挂起(suspend)和恢复(resume)cgroup中的进程
blkio        # 设置对块设备（比如硬盘）的输入输出访问控制
perf_event   # 面向事件的观察工具
hugetlb      # 文件系统
```

- hierarchy

  hierarchy是吧一组cgroup串成一个树状的结构，一个这样的树就是一个hierarchy，通过这个树结构，Cgroup能做到继承。

- Cgroup是通过这三个组件之间的相互协作实现的。

  - 系统首先会创建新的hierarchy，在这之后，系统中所有的进程会加入到这个hierarchy的根节点，这个根节点是hierchy默认创建的。
  - 一个subsystem只能附加到一个hierarchy上
  - 一个hierarchy上能够附加多个subsystem
  - 一个进程可以最为多个cgroup的成员，但是这些cgroup必须在不同的hierarchy中。
  - 一个进程fork出子进程时，子进程和父进程是在同一个cgroup中的，我们也可以根据需要将其移动到其他的cgroup中。

#### 3.2.1 创建一个hierarchy

```sh
# 创建一个hierarchy
mkdir cgroup-test
# 挂载一个hierarchy
sudo mount -t cgroup -o none,name=cgroup-test cgroup-test ./cgroup-test
# 挂在后我们就可以看到系统在这个目录下生成了一些默认文件
cgroup.clone_children  cgroup.procs          notify_on_release  tasks
cgroup.event_control   cgroup.sane_behavior  release_agent
```

这个文件就是这个hierarchy中cgroup根节点的配置项。

- cgroup.clone_children,cpuset的subsystem会读取这个配置文件。默认为0，如果这个值是1，子cgroup才会继承父cgroup的cpuset配置。
- cgroup.procs是树中当前节点cgroup中的进程ID。
- notify_on_release和release_agent 一起使用。notify_on_release标识cgroup最后一个进程退出的时候是否执行了release_agent。而release_agent则是一个路径。通常用于进程退出之后自动清理掉不再使用的cgroup。

#### 3.2.2 扩展两个子Cgroup

```sh
chanshaw@ubuntu:~/cgroup-test$ sudo mkdir cgroup-1
chanshaw@ubuntu:~/cgroup-test$ sudo mkdir cgroup-2
chanshaw@ubuntu:~/cgroup-test$ tree
.
├── cgroup-1
│   ├── cgroup.clone_children
│   ├── cgroup.event_control
│   ├── cgroup.procs
│   ├── notify_on_release
│   └── tasks
├── cgroup-2
│   ├── cgroup.clone_children
│   ├── cgroup.event_control
│   ├── cgroup.procs
│   ├── notify_on_release
│   └── tasks
├── cgroup.clone_children
├── cgroup.event_control
├── cgroup.procs
├── cgroup.sane_behavior
├── notify_on_release
├── release_agent
└── tasks
```

创建文件夹的时候，kernel会把文件夹标记为这个cgroup的子cgroup。会继承父cgroup的属性。

### 3.2.3 在Cgroup中添加移动进程

```sh
echo $$
3927
# 将我所在的终端进程移动到cgroup-1中
sudo sh -c "echo $$ >> tasks"
cat /proc/3927/cgroup
# 可以看到3927已经被加入进程中了
12:name=cgroup-test:/cgroup-1
11:name=systemd:/user/1000.user/c2.session
10:hugetlb:/user/1000.user/c2.session
9:perf_event:/user/1000.user/c2.session
8:blkio:/user/1000.user/c2.session
7:freezer:/user/1000.user/c2.session
6:devices:/user/1000.user/c2.session
5:memory:/user/1000.user/c2.session
4:cpuacct:/user/1000.user/c2.session
3:cpu:/user/1000.user/c2.session
2:cpuset:/
```

# 参考文献： 
[Docker -wiki](https://zh.wikipedia.org/wiki/Docker)  

[The LXC driver was deprecated in Docker 1.8](https://github.com/moby/moby/pull/17700)

[containerd] (https://github.com/containerd)

[Hypervisor] (https://zh.wikipedia.org/wiki/Hypervisor)

[Linux namespaces] (https://en.wikipedia.org/wiki/Linux_namespaces)

[Cgroups] (https://zh.wikipedia.org/wiki/Cgroups)

[什么是linux容器](https://www.redhat.com/zh/topics/containers/whats-a-linux-container)

[什么是Docker](https://www.redhat.com/zh/topics/containers/what-is-docker)

[自己动手写Docker](https://book.douban.com/subject/27082348/)

[容器安全防护的十个级别](https://www.redhat.com/cms/managed-files/cl-container-security-openshift-cloud-devops-tech-detail-f7530kc-201705-a4-zh.pdf)

[Docker get-started](https://docs.docker.com/get-started/overview/)

