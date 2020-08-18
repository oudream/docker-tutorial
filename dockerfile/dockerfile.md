
## Docker File (Dockerfile)

- [官网 Dockerfile](https://docs.docker.com/engine/reference/builder/)

- [官网 Docker Build](https://docs.docker.com/engine/reference/commandline/build/)


### 什么是 Dockerfile？
> Dockerfile 是一个用来构建镜像的文本文件，文本内容包含了一条条构建镜像所需的指令和说明。  
> 补充：文件名称必须是：Dockerfile

### 构建镜像命令
```bash
docker build -t 机构/镜像名称<:tags> Dockerfile目录
# 比如如下，最后一个.代表当前目录，因为我的Dockerfile文件就在这，也可以用绝对路径
docker build -t chentongwei.com/mywebapp:1.0.0 .
# 然后执行docker images 进行查看会发现有我们刚才构建的镜像
docker images
```

### 基础命令 
> FROM
```bash
# 制作基准镜像
FROM 镜像
# 比如我们要发布一个应用到tomcat里，那么的第一步就是FROM tomcat
FROM tomcat<:tags>
```
> LABEL&MAINTAINER
```bash
# MAINTAINER，一般写个人id或组织id
# LABEL 就是注释，方便阅读的，纯注释说明。不会对Dockerfile造成任何影响
# 比如：
MAINTAINER baidu.com
LABEL version = "1.0.0"
LABEL description = "我们是大百度！"
# ...等等描述性信息，纯注释。
```

> WORKDIR
```bash
# 类似于Linux中的cd命令，但是他比cd高级的地方在于，我先cd，发现没有这个目录，我就自动创建出来，然后在cd进去
WORKDIR /usr/local/testdir
# 这个路径建议使用绝对路径。
```

> COPY
```bash
# 将1.txt拷贝到根目录下。它不仅仅能拷贝单个文件，还支持Go语言风格的通配符，比如如下：
COPY 1.txt /

# 拷贝所有 abc 开头的文件到testdir目录下
COPY abc* /testdir/

# ? 是单个字符的占位符，比如匹配文件 abc1.log
COPY abc?.log /testdir/
```

> ADD
```bash
# 将1.txt拷贝到根目录的abc目录下。若/abc不存在，则会自动创建
ADD 1.txt /abc

# 将test.tar.gz解压缩然后将解压缩的内容拷贝到/home/work/test
ADD test.tar.gz /home/work/test
```
- docker官方建议当要从远程复制文件时，尽量用curl/wget命令来代替ADD。因为用ADD的时候会创建更多的镜像层。镜像层的size也大。

> 对比
```txt
二者都是只复制目录中的文件，而不包含目录本身。

COPY能干的事ADD都能干，甚至还有附加功能。

ADD可以支持拷贝的时候顺带解压缩文件，以及添加远程文件（不在本宿主机上的文件）。

只是文件拷贝的话可以用COPY，有额外操作可以用ADD代替。
```

> ENV
```bash
# 设置环境常量，方便下文引用，比如：
ENV JAVA_HOME /usr/local/jdk1.8

# 引用上面的常量，下面的RUN指令可以先不管啥意思，目的是想说明下文可以通过${xxx}的方式引用
RUN ${JAVA_HOME}/bin/java -jar xxx.jar
```
- ENV设置的常量，其他地方都可以用${xxx}来引用，将来改的时候只改ENV的变量内容就行。

### 运行指令

> RUN
```bash
# SHELL命令格式
RUN yum -y install vim

# EXEC命令格式
RUN ["yum","-y","install","vim"]

# SHELL：当前shell是父进程，生成一个子shell进程去执行脚本，脚本执行完后退出子shell进程，回到当前父shell进程。
# EXEC：用EXEC进程替换当前进程，并且保持PID不变，执行完毕后直接退出，不会退回原来的进程。
# 也就是说shell会创建子进程执行，EXEC不会创建子进程。
```

> CMD
```txt
类似于 RUN 指令，用于运行程序，但二者运行的时间点不同:

CMD 在docker run 时运行。

RUN 是在 docker build。

作用：为启动的容器指定默认要运行的程序，程序运行结束，容器也就结束。CMD 指令指定的程序可被 docker run 命令行参数中指定要运行的程序所覆盖。

注意：如果 Dockerfile 中如果存在多个 CMD 指令，仅最后一个生效。
```

> 
```txt
类似于 CMD 指令，但其不会被 docker run 的命令行参数指定的指令所覆盖，而且这些命令行参数会被当作参数送给 ENTRYPOINT 指令指定的程序。

但是, 如果运行 docker run 时使用了 --entrypoint 选项，此选项的参数可当作要运行的程序覆盖 ENTRYPOINT 指令指定的程序。

优点：在执行 docker run 的时候可以指定 ENTRYPOINT 运行所需的参数。

注意：如果 Dockerfile 中如果存在多个 ENTRYPOINT 指令，仅最后一个生效。
```
