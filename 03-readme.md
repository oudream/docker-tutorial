[来自修改](https://github.com/twtrubiks/docker-tutorial)

## 简介
[Docker](https://www.docker.com/)

![](https://i.imgur.com/gDcSwcs.png)

***Containers as a Service ( CaaS ) - 容器即服务***

### 什么是 Docker

> [Docker](https://www.docker.com/) 是一个开源项目，出现于 2013 年初，最初是 Dotcloud 公司内部的 Side-Project。它基于 Google 公司推出的 Go 语言实作。

> Docker 是一个开源的应用容器引擎，而一个容器containers其实是一个虚拟化的独立的环境，让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后发布到任何流行的 Linux 机器上【
Windows 虚拟底层支撑：WSL、WSL2/hyper-v；
[OSX：Hypervisor.framewor](https://developer.apple.com/documentation/hypervisor)；
参考：Docker容器的原理与实践 [上编](https://sq.163yun.com/blog/article/170973039172706304) [上编](https://sq.163yun.com/blog/article/171012695692075008) 
】，也可以实现虚拟化。容器是完全使用沙箱机制，相互之间不会有任何接口。
  
> 组成：上游组件（containerd，linuxkit 等）-> Moby -> Docker CE -> Docker EE

> Docker 的局限性之一，它只能用在 64 位的操作系统上。

我们先来看看官网的说明

Comparing Containers and Virtual Machines ( 传统的虚拟化 )

![](https://i.imgur.com/IqiGyoJ.png)

从这张图可以看出 Containers 并没有 OS ，容量自然就小，而且启动速度神快

详细可参考 [https://www.docker.com/what-container](https://www.docker.com/what-container)

一个表格了解 Docker 有多棒 :+1:

Feauture  | Containers                  |  Virtual Machines ( 传统的虚拟化 )
--      | ----------            | ----------
 启动   | 秒开 | 最快也要分钟
 容量 | MB        | GB
 效能 | 快        | 慢
 支援数量 | 非常多 Containers        | 10多个就很了不起了
 复制相同环境 | 快        | 超慢

![](https://i.imgur.com/H8wmOUh.jpg)

图的来源
[https://blog.jayway.com/2015/03/21/a-not-very-short-introduction-to-docker/](https://blog.jayway.com/2015/03/21/a-not-very-short-introduction-to-docker/)

### 使用场景
- Docker 的使用场景创建一致的开发、测试、生产环境；  
- 创建资源隔离的运行时环境；
- 创建多用户的平台即服务（PaaS）的基础设施；
- 创建软件即服务（SaaS）的应用程序；高性能、超大规模宿主机部署；

### Docker 版本
- Docker 是一个开源的商业产品，有两个版本：社区版（Community Edition，缩写为 CE）和企业版（Enterprise Edition，缩写为 EE）。
- 企业版包含了一些收费服务，个人开发者一般用不到。下面的介绍都针对社区版。


### Docker 概念

> 建议大家先了解一下 Docker 中的几个名词，分别为

***Image 镜像***

> 镜像，可以把它想成是以前我们在玩 VM 的 Guest OS（ 安装在虚拟机上的作业系统 ）。

Image 是只读（ R\O ）

***Container 容器***

> 容器，利用镜像（ Image ）所创造出来的，一个 Image 可以创造出多个不同的 Container，

> Container 也可以被启动、开始、停止、删除，并且互相分离。

> Container 在启动的时候会建立一层在最外（上）层并且是读写模式（ R\W ）。

Docker 的镜像分层机制：
> Docker 镜像是分层构建的，Dockerfile 中每条指令都会新建一层。例如以下 Dockerfile:
```bash
FROM ubuntu:18.04
COPY . /app
RUN make /app
CMD python /app/app.py
```
> 以上四条指令会创建四层，分别对应基础镜像、复制文件、编译文件以及入口文件，每层只记录本层所做的更改，而这些层都是只读层。当你启动一个容器，Docker 会在最顶部添加读写层，你在容器内做的所有更改，如写日志、修改、删除文件等，都保存到了读写层内，一般称该层为容器层，如下图所示

这张图解释了 Image 是唯读（ R\O ）以及 Container 是读写模式（ R\W ） 的关系

![](https://i.imgur.com/wVvrWwJ.png)

更多关系可参考 [https://docs.docker.com/engine/userguide/storagedriver/imagesandcontainers/#images-and-layers](https://docs.docker.com/engine/userguide/storagedriver/imagesandcontainers/#images-and-layers)

***Registry 仓库***

可以把它想成类似 [GitHub](https://github.com/)，里面存放了非常多的 Image ，可在 [Docker Hub](https://hub.docker.com/) 中查看。

更详细的我这边就不再解释惹，留给大家做作功课:stuck_out_tongue:

## 安装

Windows

> Windows安装有两种方式：依赖 Hyper-V、依赖 WSL

- 依赖 WSL
> 参考：[https://docs.docker.com/docker-for-windows/wsl/](https://docs.docker.com/docker-for-windows/wsl/)

- 依赖 Hyper-V
> 请先到 Docker 官网  
> [https://www.docker.com/docker-windows](https://www.docker.com/docker-windows)  
> 下载 stable 版本

![](https://i.imgur.com/ryKtNXm.jpg)

> 接下来就是无脑安装，安装完后他会叫你登出计算机，点下去后就会帮你登出计算机

![](https://i.imgur.com/EE7XmYM.jpg)

> 接着如果你的计算机没有启用 [Hyper-V](https://msdn.microsoft.com/zh-tw/library/hh831531(v=ws.11).aspx) ，他会叫你重启计算机
(一样，点下去就对惹)  
> ( 更多可 Hyper-V 介绍请参考 [https://docs.microsoft.com/zh-tw/virtualization/hyper-v-on-windows/about/](https://docs.microsoft.com/zh-tw/virtualization/hyper-v-on-windows/about/) )

![](https://i.imgur.com/YG79VE1.jpg)

> 重新开机后，你就会发现可爱的 Docker 在右下角蹦出来惹

![](https://i.imgur.com/zMgf36E.png)

> 我们可以再用 cmd 确认一下是否有成功安装

```cmd
docker --version
docker-compose --version
```

![](https://i.imgur.com/k1o3GIz.png)

> 记得再设定一个东西 Shared Drives

![](https://i.imgur.com/a6dqWU8.jpg)

> 装完了之后，建议大家再多装一个 [Kitematic](https://kitematic.com/)，他是 GUI 界面的，方便你使用 Docker，  
> ( 后面会再介绍一个更赞的 GUI 界面 [portainer](https://github.com/portainer/portainer)  :grin: )  
> 我知道打指令很潮，但还是建议装一下。

> 直接对着你的 Docker 图示右键，就可以看到 [Kitematic](https://kitematic.com/)

![](https://i.imgur.com/gdVFFMT.png)

![](https://i.imgur.com/SRaHNCP.jpg)

> 下载回来直接解压缩双点击即可使用

![](https://i.imgur.com/9zsU23B.png)

- MAC

> MAC 我本身也有，但因为更早之前就装了，步骤就没记录了，基本上大同小异

[https://www.docker.com/docker-mac](https://www.docker.com/docker-mac)

- Linux
> 参考官网  
> ubuntu: [https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/  )
```bash
### install - ubuntu
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
```  
> centos: [https://docs.docker.com/engine/install/centos/](https://docs.docker.com/engine/install/centos/  )
```bash
### install - centos
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --enable docker-ce-nightly
sudo yum-config-manager --enable docker-ce-test
sudo yum install -y docker-ce docker-ce-cli containerd.io
#
sudo systemctl start docker
sudo docker run hello-world
```  

安装后步骤 (optional:exclamation:), 但建议参考一下

[Post-installation steps for Linux](https://docs.docker.com/install/linux/linux-postinstall/)

docker-compose 的安装

[docker-compose install](https://docs.docker.com/compose/install/)

系统资源分配问题,

假如你是使用 windows 或是 mac 的 docker,

你会有一个界面可以设定你要分多少的 cpu 以及 ram 给你的 docker,

通常会在 Preferences -> Advanced, 有 GUI 界面,

![](https://i.imgur.com/CWMQHxs.png)

但如果是使用 linux, 就不会有这个界面, 因为在 Linux 中,

会自动依照系统的资源进行分配.

## 指令介绍

接着介绍一些 Docker 的指令，

Docker 的指令真的很多，这里就介绍我比较常用的或是实用的指令

查看目前 images

```cmd
docker images
```

建立 image

```cmd
docker create [OPTIONS] IMAGE [COMMAND] [ARG...]
```

详细的参数可参考 [https://docs.docker.com/engine/reference/commandline/create/](https://docs.docker.com/engine/reference/commandline/create/)

范例 ( 建立一个名称为  busybox 的 image )

```cmd
docker create -it --name busybox busybox
```

删除 Image

```cmd
docker rmi [OPTIONS] IMAGE [IMAGE...]
```

查看目前运行的 container

```cmd
docker ps
```

查看目前全部的 container（ 包含停止状态的 container ）

```cmd
docker ps -a
```

新建并启动 Container

```cmd
docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...]
```

举个例子

```cmd
docker run -d -p 80:80 --name my_image nginx
```

`-d` 代表在 Detached（ 背景 ）执行，如不加 `-d`，预设会 foreground ( 前景 ) 执行

`-p` 代表将本机的 80 port 的所有流量转发到 container 中的 80 port

`--name` 设定 container 的名称

在举一个例子

```cmd
 docker run -it --rm busybox
```

`--rm` 代表当 exit container 时，会自动移除 container。 ( incompatible with -d )

更详细的可参考 [https://docs.docker.com/engine/reference/run/](https://docs.docker.com/engine/reference/run/)

启动 Container

```cmd
docker start [OPTIONS] CONTAINER [CONTAINER...]
```

如果想让他在前景跑顺便观看输出 , 可以使用以下指令

```cmd
docker start -a [OPTIONS] CONTAINER [CONTAINER...]
```

`--attach` 或 `-a` 代表 Attach STDOUT/STDERR and forward signals.

更详细的可参考 [https://docs.docker.com/engine/reference/commandline/start/](https://docs.docker.com/engine/reference/commandline/start/)

（ container ID 写几个就可以了，和 Git 的概念是一样的 ，

不了解 Git 可以参考 [Git-Tutorials GIT基本使用教学](https://github.com/twtrubiks/Git-Tutorials) ）

停止 Container

```cmd
docker stop [OPTIONS] CONTAINER [CONTAINER...]
```

重新启动 Container

```cmd
docker restart [OPTIONS] CONTAINER [CONTAINER...]
```

删除 Container

```cmd
docker rm [OPTIONS] CONTAINER [CONTAINER...]
```

`--volumes , -v` 加上这个参数，会移除掉连接到这个 container 的 volume。

可参考 [https://docs.docker.com/engine/reference/commandline/rm/](https://docs.docker.com/engine/reference/commandline/rm/)

进入 Container

```cmd
docker exec [OPTIONS] CONTAINER COMMAND [ARG...]
docker exec -it <Container ID> bash
```

使用 root 使用者进入　

```cmd
docker exec -u 0 -it <Container ID> bash
docker exec -u root -it <Container ID> bash
```

打指令比较潮，或是说你也可以透过 [Kitematic](https://kitematic.com/) 进入。

[](https://i.imgur.com/Yui1UZb.png)

当我们进入了 Container 之后，有时候想看一下里面 Linux 的版本，

这时候可以使用以下指令查看

```cmd
cat /etc/os-release
```

查看 Container 详细资料

```cmd
docker inspect [OPTIONS] NAME|ID [NAME|ID...]
```

查看 log

```cmd
docker logs [OPTIONS] CONTAINER
```

`--follow` , `-f`  ,  Follow log output

更详细的可参考 [https://docs.docker.com/engine/reference/commandline/logs/](https://docs.docker.com/engine/reference/commandline/logs/)


从最后 100 行开始追踪,

```cmd
docker logs -f --tail 100 CONTAINER
```

显示容器资源 ( CPU , I/O ...... )

```cmd
docker stats [OPTIONS] [CONTAINER...]
```

停止指定的 CONTAINER 中全部的 **processes**

```cmd
docker pause CONTAINER [CONTAINER...]
```

执行 `docker pause` 之后，可以试这用 `docker ps` 查看，会发现

还是有在执行，这里拿  `docker stop`  比较一下，差异如下。

 `docker stop` : process 级别。

 `docker pause`: container 级别。

恢复指定暂停的 CONTAINER 中全部的 **processes**

```cmd
docker unpause CONTAINER [CONTAINER...]
```

docker tag

```cmd
docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
```

范例

```cmd
docker tag 0e5574283393 twtrubiks/nginx:version1.0
```

更多可参考 [https://docs.docker.com/engine/reference/commandline/tag/](https://docs.docker.com/engine/reference/commandline/tag/)

储存 (备份) image 成 tar 档案

```cmd

[OPTIONS] IMAGE [IMAGE...]
```

范例

```cmd
docker save busybox > busybox.tar
```

或

```cmd
docker save --output busybox.tar busybox
```

或 ( 也可以一次备份多个 )

```cmd
docker save -o images.tar postgres:9.6 busybox
```

更多可参考 [https://docs.docker.com/engine/reference/commandline/save/](https://docs.docker.com/engine/reference/commandline/save/)

载入 image

```cmd
docker load [OPTIONS]
```

范例

```cmd
docker load < busybox.tar
```

或

```cmd
docker load -i busybox.tar
```

更多可参考 [https://docs.docker.com/engine/reference/commandline/load/](https://docs.docker.com/engine/reference/commandline/load/)

显示 image 的 history，查询 image 的每一层

```cmd
docker history [OPTIONS] IMAGE
```

在 docker 中，一层一层的概念很重要。

![](https://i.imgur.com/NmImVby.png)

更多可参考 [https://docs.docker.com/engine/reference/commandline/history/](https://docs.docker.com/engine/reference/commandline/history/)

刚刚有教大家如何储存 (备份) images， 载入 images，

还有另外一种是 export 和 import containers，

docker export container 请参考 [https://docs.docker.com/engine/reference/commandline/export/](https://docs.docker.com/engine/reference/commandline/export/)。

docker import container 请参考 [https://docs.docker.com/engine/reference/commandline/import/](https://docs.docker.com/engine/reference/commandline/import/)。

其他指令

删除所有 dangling images

```cmd
docker image prune
```

移除全部 unused images (不只 dangling images)

```cmd
docker image prune -a
```

更多信息可参考 [image_prune](https://docs.docker.com/engine/reference/commandline/image_prune/)

停止所有正在运行的 Container

```cmd
docker container stop $(docker ps -q)
```

更多信息可参考 [container_stop](https://docs.docker.com/engine/reference/commandline/container_stop/)

移除全部停止的 containers

```cmd
docker container prune
```

更多信息可参考 [container_prune](https://docs.docker.com/engine/reference/commandline/container_prune/)

### Volume

接下来要介绍 Volume，Volume 是 Docker 最推荐存放 persisting data（ 数据 ）的机制，

使用 Volume 有下列优点

* Volumes are easier to back up or migrate than bind mounts.
* You can manage volumes using Docker CLI commands or the Docker API.
* Volumes work on both Linux and Windows containers.
* Volumes can be more safely shared among multiple containers.
* Volume drivers allow you to store volumes on remote hosts or cloud providers, to encrypt the contents of volumes, or to add other functionality.
* A new volume's contents can be pre-populated by a container.

在 container 的可写层中，使用 volume 是一个比较好的选择，因为他不会增加 container 的容量，

volume 的内容存在于 container 之外。

也可参考下图

![](https://i.imgur.com/fiIt0kS.png)

更详细的可参考 [https://docs.docker.com/engine/admin/volumes/volumes/](https://docs.docker.com/engine/admin/volumes/volumes/)

查看目前的 volume

```cmd
docker volume ls [OPTIONS]
```

创造一个 volume

```cmd
docker volume create [OPTIONS] [VOLUME]
```

删除一个 volume

```cmd
docker volume rm [OPTIONS] VOLUME [VOLUME...]
```

查看 volume 详细资料

```cmd
docker volume inspect [OPTIONS] VOLUME [VOLUME...]
```

移除全部未使用的 volume

```cmd
docker volume prune [OPTIONS]
```

### network

建议大家花点时间研究 docker 中的 network，会蛮有帮助的 :smiley:

查看目前 docker 的网络清单

```cmd
docker network ls [OPTIONS]
```

详细可参考 [https://docs.docker.com/engine/userguide/networking/](https://docs.docker.com/engine/userguide/networking/)

docker 中的网络主要有三种 Bridge、Host、None，预设皆为 Bridge 模式。

指定 network 范例 ( 指定使用  `host` 网络 )

```cmd
docker run -it --name busybox --rm --network=host busybox
```

建立 network

```cmd
docker network create [OPTIONS] NETWORK
```

移除 network

```cmd
docker network rm NETWORK [NETWORK...]
```

移除全部未使用的 network

```cmd
docker network prune [OPTIONS]
```

查看 network 详细资料

```cmd
docker network inspect [OPTIONS] NETWORK [NETWORK...]
```

将 container 连接 network

```cmd
docker network connect [OPTIONS] NETWORK CONTAINER
```

更多详细资料可参考 [https://docs.docker.com/engine/reference/commandline/network_connect/](https://docs.docker.com/engine/reference/commandline/network_connect/)

Disconnect container  network

```cmd
docker network disconnect [OPTIONS] NETWORK CONTAINER
```

更多详细资料可参考 [https://docs.docker.com/engine/reference/commandline/network_disconnect/](https://docs.docker.com/engine/reference/commandline/network_disconnect/)

#### User-defined networks

这个方法是官方推荐的 :thumbsup:

透过内建的 DNS 服务器，可以直接使用容器名称，就可解析出 IP，不需要再使用 IP 让容器互相

沟通，我们只需要知道容器的名称就可以连接到容器。

更多详细资料可参考 [https://docs.docker.com/engine/userguide/networking/#user-defined-networks](https://docs.docker.com/engine/userguide/networking/#user-defined-networks)

## docker-compose

再来要介绍 docker-compose，可参考官网 [https://docs.docker.com/compose/](https://docs.docker.com/compose/)

![](https://i.imgur.com/YxrrO7t.png)

Compose 是定义和执行多 Container 管理的工具，不懂我在说什么:question::question::question:

试着想想看，通常一个 Web 都还会有 DB，甚至可能还有 [Redis](https://redis.io/) 或 [Celery](http://www.celeryproject.org/)，

所以说我们需要有 Compose 来管理这些，透过 `docker-compose.yml` ( YML 格式 ) 文件。

`docker-compose.yml` 的写法可参考 [https://docs.docker.com/compose/compose-file/](https://docs.docker.com/compose/compose-file/)

也可以直接参考官网范例 [https://docs.docker.com/compose/compose-file/#compose-file-structure-and-examples](https://docs.docker.com/compose/compose-file/#compose-file-structure-and-examples)

Compose 的 Command-line 很多和 Docker 都是类似的，

可参考 [https://docs.docker.com/glossary/?term=compose](https://docs.docker.com/glossary/?term=compose)

查看目前 Container

```cmd
docker-compose ps
```

加上 `-q` 的话，只显示 id

```cmd
docker-compose ps -q
```

启动 Service 的 Container

```cmd
docker-compose start  [SERVICE...]
```

停止 Service 的 Container ( 不会删除 Container )

```cmd
docker-compose stop [options] [SERVICE...]
```

重启 Service 的 Container

```cmd
docker-compose restart [options] [SERVICE...]
```

Builds, (re)creates, starts, and attaches to containers for a service

```cmd
docker-compose up [options] [--scale SERVICE=NUM...] [SERVICE...]
```

加个 `-d`，会在背景启动，一般建议正式环境下使用。

```cmd
docker-compose up -d
```

`up` 这个功能很强大，建议可以参考 [https://docs.docker.com/compose/reference/up/](https://docs.docker.com/compose/reference/up/)

如果你希望每次都重新 build image，可以加上

`--build` ( Build images before starting containers. )

```cmd
docker-compose up -d --build
```

docker-compose down

```cmd
docker-compose down [options]
```

`down` 这个功能也建议可以参考 [https://docs.docker.com/compose/reference/down/](https://docs.docker.com/compose/reference/down/)

举个例子

```cmd
docker-compose down -v
```

加个 `-v` 就会顺便帮你把 volume 移除（ 移除你在 `docker-compose.yml` 里面设定的 volume ）

在指定的 Service 中执行一个指令

```cmd
docker-compose run [options] [-v VOLUME...] [-p PORT...] [-e KEY=VAL...] SERVICE [COMMAND] [ARGS...]
[ARGS...]
```

举个例子

```cmd
docker-compose run web bash
```

在 web Service 中执行 `bash` 指令

可参考 [https://docs.docker.com/compose/reference/run/](https://docs.docker.com/compose/reference/run/)

观看 Service logs

```cmd
docker-compose logs [options] [SERVICE...]
```

检查 `docker-compose.yml` 格式是否正确

```cmd
docker-compose config
```

如下指令，和 `docker exec` 一样

```cmd
docker-compose exec
```

范例 ( 进入 web 这个 service 的 bash )

```cmd
docker-compose exec web bash
```

显示被使用到的 container 中的 images 清单

```cmd
docker-compose images
```

移除  service containers

```cmd
docker-compose rm
```

Pushes images 到 docker hub

```cmd
docker-compose push
```

目前这个指令其实我也搞不太懂，可参考 [https://github.com/docker/compose/issues/4283](https://github.com/docker/compose/issues/4283)

官网也解释的没有很清楚 [https://docs.docker.com/compose/reference/push/](https://docs.docker.com/compose/reference/push/)

### docker-compose up/down 和 restart 的差异

* [Youtube Tutorial- docker-compose up/down 和 restart 的差异](https://youtu.be/nX-sbLPz-MU)

先来谈 `docker-compose up/down`,

假如今天你修改了 `docker-compose.yml` 又或是更新了 image,

当你要重建 docker , 有几种方法,

方法一.

先停止 container, 执行 `docker-compose down` 再执行 `docker-compose up`.

方法二.

不需要停止 container, 直接执行 `docker-compose up -d`.

(他会自动帮你重建, 很方便, 不需要多一步先关闭 container )

结论, 只要你的 `docker-compose.yml` 有任何变动, 一定要执行 `docker-compose up` 才会生效.

再来谈 `docker-compose restart`,

请看官方文件 [docker-compose restart](https://docs.docker.com/compose/reference/restart/), 如果你对 `docker-compose.yml` 修改, 然后使用这个指令, 是**不会**生效的,

但是, 如果你是改 code (可能是 python code), 那这个指令是有效的.

### docker-compose networks

* [Youtube Tutorial - docker-compose networks 说明](https://youtu.be/wmV9WfkpyGk)

这边多补充 docker-compose networks 的观念，因为刚好最近有用到:smile:

```yml
version: '3.5'
services:

    db:
      container_name: 'postgres'
      image: postgres
      environment:
        POSTGRES_PASSWORD: password123
      ports:
        - "5432:5432"
        # (HOST:CONTAINER)
      volumes:
        - pgdata:/var/lib/postgresql/data/
      networks:
        - proxy

    web:
      build: ./api
      command: python manage.py runserver 0.0.0.0:8000
      restart: always
      volumes:
        - api_data:/docker_api
        # (HOST:CONTAINER)
      ports:
        - "8000:8000"
        # (HOST:CONTAINER)
      depends_on:
        - db
      networks:
        - proxy

volumes:
    api_data:
    pgdata:

networks:
    proxy:
      # external:
        name: my_network
```

先把 version 改成 3.5，因为这版本才开始有 networks name 的概念，在

db 以及 web 中都加了 networks ( 自己定义的 )，定义的地方在最后面，

proxy 是名称 ( 类似 volumes 的概念 )，`external` option 的意思代表

是不是要参考外部别人已经定义好的 network ( 所以如果找不到就会报错 )，

但如果不加上 `external` option，也就代表是自己定义的，会帮你自动建立

你所定义的 network，名称为 my_network。

如果你都完全没有定义 networks，预设就是资料夹的名称_default 。

### docker-compose ports 和 expose 差异

在 docker-compose 中有两种方法可以暴露容器 ports，

分别是 ports 和 expose，

#### ports

```yml
...
ports:
  - "5000:5000"  # 绑定 container 中的 5000 port 到 本机(HOST) 的 5000 port
  # (HOST:CONTAINER)

  - "5001:5000"  # 绑定 container 中的 5000 port 到 本机(HOST) 的 5001 port

  - "5000"       # 绑定 container 中的 5000 port 到本机的任意 port (本机会随机被分配到一个 port)
...
```

随机 port 范例，

这边使用 dpage/pgadmin4 这个 images 来示范，

```cmd
docker run -p 80 \
    -e "PGADMIN_DEFAULT_EMAIL=xxxrubiks@gmail.com" \
    -e "PGADMIN_DEFAULT_PASSWORD=SuperSecret" \
    -d dpage/pgadmin4
```

如果我们执行两次以上指令，你会发现本机被分配到两个随机的 ports (如下图)，

![alt tag](https://i.imgur.com/kkcnuJI.png)

本机被随机分配到 32768 以及 32769 port，

这边不管我们怎么设定 ports，这些 ports 都会暴露给本机 (HOST) 以及其他 containers，这点很重要:exclamation::exclamation:

也就是说，如果本机 5001 ports 被使用了，其他的 containers 就无法使用 5001 ports，

可能要改成5002 ports 之类的。

#### expoese

```yml
...
expose:
  - "4000"
  - "6000"
...
```

expose 是将 port 暴露给其他容器。

expose 和 ports 最大的差别就是在 expose 不会暴露 port 给本机(HOST)，

所以 本机(HOST)绝对无法被访问，但 containers 内可以被访问，

所以说如果今天你的容器想要在 本机(HOST) 被访问，一定要使用 ports 方式。

***ports 和 expose 差异***

简单说，就是 ports 可以被 本机(HOST) 和 containers 访问 ; 而

expose 是本机(HOST) 无法被访问，只有在 containers 中可以被访问。

## Docker Registry

![](https://i.imgur.com/uAXUtxT.png)

可以把它想成是一个类似 github 的地方，只不过里面变成是存 docker 的东西，当然，

也可以自己架，但会有一些额外的成本，象是网络，维护等等，这部分就要自己衡量了:grinning:

接下来教大家如何将 image push 到 Docker Registry :smiley:

* [Youtube Tutorial PART 4 - Docker push image to Docker Hub 教学](https://youtu.be/dVBKwmqO5e4)

首先，先登入 [Docker Registry](https://hub.docker.com/)  ( 注册流程很简单，我就跳过了 )

```cmd
docker login
```

![](https://i.imgur.com/lm9GWTj.png)

举个例子，先 run 一个 busybox 的容器

```cmd
docker run -it busybox
```

接着在里面新增一笔资料

```cmd
 echo 'text' > data.txt
```

![](https://i.imgur.com/KCeZGQh.png)

然后打开另一个 terminal ，使用 `docker ps` 查看目前容器的 id

![](https://i.imgur.com/mBIhGBW.png)

再来使用像 git 一样的方式 commit

docker commit

```cmd
docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
```

可参考 [https://docs.docker.com/engine/reference/commandline/commit/](https://docs.docker.com/engine/reference/commandline/commit/)

```cmd
docker commit -m "test" 4fb4ef51e917 twtrubiks/my_busybox
```

`-m` commit message ，和 git 一样。

twtrubiks/my_busybox 则为我们定义的 REPOSITORY。

如果需要 tag , 也可以增加

```cmd
docker commit -m "test" 4fb4ef51e917 twtrubiks/my_busybox:v1
```

（ 如果没定义 tag , 则会显示 latest ）

这时候可以用 `docker images` 查看

![](https://i.imgur.com/R548ail.png)

最后 push

```cmd
docker push twtrubiks/my_busybox
```

![](https://i.imgur.com/2ExgYpB.png)

docker 是一层一层的概念，他只会 push 自己新增的几层上去而已，

所以不用担心整个 image 很大，要上传很久 :relaxed:

最后可以到 [https://hub.docker.com/](https://hub.docker.com/) 确认是否有成功 :smile:

![](https://i.imgur.com/W5P3YQL.png)

## 用 Docker 实战 Django 以及 Postgre

* [Youtube Tutorial PART 2 - 用 Docker 实战 Django 以及 Postgre](https://youtu.be/aZ6woJ7qekE)

上面介绍了那么多，来实战一下是必须的 :satisfied:

我们使用 [Django-REST-framework 基本教学 - 从无到有 DRF-Beginners-Guide](https://github.com/twtrubiks/django-rest-framework-tutorial) 来当范例

有几个地方必须修改一下，

将 `settings.py`  里面的 db 连线改成 [PostgreSQL](https://www.postgresql.org/)

```pyhon
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'postgres',
        'USER': 'postgres',
        'PASSWORD': 'password123',
        'HOST': 'db',
        'PORT': 5432,
    }
}
```

建议也将 `ALLOWED_HOSTS = []` 改为 `ALLOWED_HOSTS = ['*']`
（ 这只是方便，实务上不会这样使用 ）

再来是两个很重要的档案，分别为 `Dockerfile` 和 `docker-compose.yml`

`Dockerfile`

```text
FROM python:3.6.2
LABEL maintainer twtrubiks
ENV PYTHONUNBUFFERED 1
RUN mkdir /docker_api
WORKDIR /docker_api
COPY . /docker_api/
RUN pip install -r requirements.txt
```

详细可参考 [https://docs.docker.com/engine/reference/builder/](https://docs.docker.com/engine/reference/builder/)

`docker-compose.yml`

```yml
version: '3'
services:

    db:
      container_name: 'postgres'
      image: postgres
      environment:
        POSTGRES_PASSWORD: password123
      ports:
        - "5432:5432"
        # (HOST:CONTAINER)
      volumes:
        - pgdata:/var/lib/postgresql/data/

    web:
      build: ./api
      command: python manage.py runserver 0.0.0.0:8000
      restart: always
      volumes:
        - api_data:/docker_api
        # (HOST:CONTAINER)
      ports:
        - "8000:8000"
        # (HOST:CONTAINER)
      depends_on:
        - db

volumes:
    api_data:
    pgdata:
```

详细可参考 [https://docs.docker.com/compose/compose-file/#compose-file-structure-and-examples](https://docs.docker.com/compose/compose-file/#compose-file-structure-and-examples)

温馨小提醒 1  :heart:

可能有人会问为什么我是使用 `0.0.0.0`，而不是使用 `127.0.0.1`:question::question:

```cmd
python manage.py runserver 0.0.0.0:8000
```

`127.0.0.1`，并不代表真正的 **本机**，我们经常认为他是本机是因为我们计算机的 `host` 预设都帮你设定好了:smirk:

详细的 `host` 设定教学可参考 [hosts-设定档 以及 查询内网 ip](https://github.com/twtrubiks/docker-django-nginx-uswgi-postgres-tutorial#hosts-设定档-以及-查询内网-ip)，

`0.0.0.0` 才是真正的代表，**当下 ( 本 ) 网络中的本机** :pencil2:

如果大家想更深入的了解，可 google 再进一步的了解 `127.0.0.1` 以及 `0.0.0.0` 的差异 :smile:

温馨小提醒 2  :heart:

这边要特别提一下 `depends_on` 这个参数，

详细可参考 [https://docs.docker.com/compose/compose-file/#depends_on](https://docs.docker.com/compose/compose-file/#depends_on)，

上面连结中有一段说明很值得看

****depends_on does not wait for db and redis to be 「ready」 before starting web - only until they have been started. If you need to wait for a service to be ready, see Controlling startup order for more on this problem and strategies for solving it.****

以我的 [docker-compose.yml](https://github.com/twtrubiks/docker-tutorial/blob/master/docker-compose.yml) 为例，启动顺序虽然为 db -> web，**但他不会等待 db 启动完成后才启动 web**，

也就是说，还是有可能 **web 比 db 先启动完成**，这样就需要重启 web service，否则会无法连上 db :sob:

如果真的要控制启动顺序，请参考 [Controlling startup order](https://docs.docker.com/compose/startup-order/)。

温馨小提醒 3  :heart:

`docker-compose.yml` 其实使用 `docker run` 也是可以完成的，例如这个范例中，如果使用

`docker run` 来写，会变成这样。

首先，为了让容器彼此可以沟通，我们先建立一个网络 ( User-defined networks )，

```cmd
docker network create my_network
```

db 容器

```cmd
docker run --name db -v pgdata:/var/lib/postgresql/data/ -p 5432:5432 --network=my_network -e POSTGRES_PASSWORD=password123 postgres
```

接下来先去 api 资料夹中 build 出 image

```cmd
docker build --tag web_image .
```

`--tag , -t` , tag 这个 image 名称为 web_image

也可以是

```cmd
docker build -t user/repo:tag .
```

web 容器

```cmd
docker run --name web -v api_data:/docker_api -p 8000:8000 --network=my_network --restart always web_image python manage.py runserver 0.0.0.0:8000
```

以上这样，和 `docker-compose.yml`  其实是一样的:open_mouth:

设定完了之后，接下来我们就可以启动他了

```cmd
docker-compose up
```

接下来你会看到类似的画面

![](https://i.imgur.com/GJWIgEP.png)

![](https://i.imgur.com/dVRRyrM.png)

假如你出现了类似的画面

![](https://i.imgur.com/cCEmVBq.png)

代表 database 还在建立的时候，你的 web ( Django ) 就去连接他，

所以导致连接不上，这时候我们可以先终止他 ( 按 Ctrl+C )

接着在重新 `docker-compose up`

我们成功启动了 ( db 连线也正常 )

![](https://i.imgur.com/iuCxLMY.png)

但你仔细看上图，你会发现他说你还没 migrate

接下来我们开启另一个 cmd 进入 web 的 service，

透过刚刚介绍的指令进入 service

```cmd
docker ps
docker exec -it <Container ID> bash
```

或是说也可以从 [Kitematic](https://kitematic.com/) 进入，

进入后我们可以开始 migrate

```cmd
python manage.py makemigrations musics
python manage.py migrate
```

![](https://i.imgur.com/zMmZKuL.png)

顺便在建立一个 superuser

```cmd
python manage.py createsuperuser
```

接着我们可以试着使用 GUI 介绍连接 db，

因为我们是用 [PostgreSQL](https://www.postgresql.org/)  ，可以透过 [pgadmin](https://www.pgadmin.org/) 连线

![](https://i.imgur.com/2Hdt7wU.png)

我们刚刚 migrate 的东西确实有存在

![](https://i.imgur.com/PEUfGRy.png)

我们不需要再重新启动

直接可以开开心心的去浏览 [http://127.0.0.1:8000/api/music/](http://127.0.0.1:8000/api/music/)

大家一定会看到很熟悉的画面

![](https://i.imgur.com/pzqZbdz.png)

接着依照自己刚刚设定的帐密登入进去即可

![](https://i.imgur.com/l6RZXsQ.png)

![](https://i.imgur.com/xeJtRJc.png)

以上整个环境，都是在 Docker 中 :open_mouth:

如果我们再 Ctrl+C 退出，重新启动一次  `docker-compose up`

这次就不会再和你说你没有 migrate 了

![](https://i.imgur.com/zIBkL3t.png)

## 其他管理 Docker GUI 的工具

* [Youtube Tutorial PART 3 - Docker 基本教学 - 透过 portainer 管理  Docker](https://youtu.be/VZjHmBcEcew)

除了 [Kitematic](https://kitematic.com/) 之外，还有其他不错的推荐给大家，

这次要介绍的就是 [portainer](https://github.com/portainer/portainer) 功能强大又好用 :fire:

其实如果去看看 [Kitematic](https://github.com/docker/kitematic) 以及 [portainer](https://github.com/portainer/portainer) 的 github，

你会发现 [portainer](https://github.com/portainer/portainer) 感觉比较有在 maintenance :smile:

而且我使用了 [portainer](https://github.com/portainer/portainer) 之后，真心大推 :smiley:

安装方法可参考 [https://portainer.io/install.html](https://portainer.io/install.html)

```cmd
docker volume create portainer_data
docker run --name=portainer -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```

`-d` `-p` 在前面的 `docker run` 有介绍过代表的含意，`--name` 只是命名而已。

`Note 1`: The -v /var/run/docker.sock:/var/run/docker.sock option is available on Linux environments only.

`Note 2`: The -v portainer_data:/data portainer/portainer option will persist Portainer data in portainer_data on the host where Portainer is running. You can specify another location on your filesystem.

（ 建立起来之后，就依照 container 的操作即可 ）

之后查看 [http://localhost:9000/](http://localhost:9000/) 就会看到下图

然后设定账号、密码

![](https://i.imgur.com/exdMf2p.png)

选 Local or Remote

![](https://i.imgur.com/3mkNMxF.png)

画面真的不错看，而且信息也很丰富 :heart_eyes:

![](https://i.imgur.com/ynoqTZT.png)

相信我，你使用完他之后，你会默默的边缘化 [Kitematic](https://kitematic.com/) :smirk:

## 查看 port 占用状况

这个推荐给大家，有时候会遇到 port 被占用，用指令查比较方便

Windows

查看所有 port 的占用状况

```cmd
netstat -ano
```

查看指定 port 的占用状况，例如现在想要查看 port 5432 占用的状况

```cmd
netstat -aon|findstr "5432"
```

查看 PID 对应的 process

```cmd
tasklist|findstr "2016"
```

停止 PID 为 6093 的 process

```cmd
taskkill /f /PID 6093
```

停止 vscode.exe process

```cmd
taskkill /f /t /im vscode.exe
```

MAC

将 port 为 8000 的 process 全部停止

```cmd
sudo lsof -t -i tcp:8000 | xargs kill -9
```

查看指定 port 的占用状况，例如现在想要查看 port 5432 占用的状况

```cmd
lsof -i tcp:5432
```

## 在 Linux 中自动启动 docker

[在 Linux 中自动启动 docker](https://github.com/twtrubiks/docker-tutorial/tree/master/docker-auto-run-linux)

## 如何清除 Docker container log

[Youtube Tutorial - 如何清除 Docker container log](https://youtu.be/SiG0tmwhqqg)

docker 的 container log 都会在 `/var/lib/docker/containers` 里面

( 前提是你使用官方的安装方法, [Youtube Tutorial-Ubuntu(Linux) 如何安装 docker](https://youtu.be/eS_HMBC_RaA))

如果你是使用 `snap` 安装 docker, 路径则会在 `/var/snap/docker/common/var-lib-docker/containers`.

![alt tag](https://i.imgur.com/sK5k4Iw.png)

log 是一个 json 的档案

![alt tag](https://i.imgur.com/feSGmcm.png)

如果你一直不去管他, log 就会越来越大:scream:

以下状况这个 log 会被清除, 就是修改了 `docker-compose.yml` 或是

你执行了 `docker-compose down`, 这些 logs 都会被清除 (因为 containers 重新建立).

(`docker-compose stop` 不受影响, 因为只是暂停而已)

建立大家可参考 [docker-compose up/down 和 restart 的差异](https://github.com/twtrubiks/docker-tutorial#docker-compose-updown-%E5%92%8C-restart-%E7%9A%84%E5%B7%AE%E7%95%B0)

那你可能会问我, 如果我很长一段时间都不会修改 `docker-compose.yml` 以及执行

`docker-compose down` 该怎么办:sob: (因为 log 可能会长很快)

这边提供大家一个方法, 使用 linux 中的 truncate 指令(可参考 [ Linux 指令教学 - truncate](https://github.com/twtrubiks/linux-note#truncate))

删除全部 container 的 logs

```cmd
truncate -s 0 /var/lib/docker/containers/*/*-json.log
```

但是有时候只希望针对(清除)某个 container 的 logs, 这时候就可以使用以下的指令

```cmd
truncate -s 0 $(docker inspect --format='{{.LogPath}}' <container_name_or_id>)
```

(`container_name_or_id` 请换上自己 container 的 id 或 name)

其中的 `docker inspect --format='{{.LogPath}}' <container_name_or_id>` 只是显示路径而已.

![alt tag](https://i.imgur.com/TKCCdio.png)

## 后记：

Docker 算是我最近才开始接触的，所以也算是新手，如果我有任何讲错的，欢迎和我说，我会再修改  :grinning:

Docker 可以玩的真的很多，延伸参考

* [实战 Docker + Jenkins + Django + Postgres ](https://github.com/twtrubiks/docker-jenkins-django-tutorial) - 结合 Jenkins

* [Docker + Django + Nginx + uWSGI + Postgres 基本教学 - 从无到有](https://github.com/twtrubiks/docker-django-nginx-uwsgi-postgres-tutorial)

* [实战 Docker + Django + Nginx + uWSGI + Postgres - Load Balance ](https://github.com/twtrubiks/docker-django-nginx-uwsgi-postgres-load-balance-tutorial)

也可以再玩玩 **Docker Swarm** ( 分散式系统 ) :satisfied:

* [Docker Swarm 基本教学 - 从无到有 Docker-Swarm-Beginners-Guide](https://github.com/twtrubiks/docker-swarm-tutorial)

最后，希望大家在学习 Docker 的过程中，遇到不懂的，可以去找资料并且了解他，
顺便补足一些之前不足的知识。

## 执行环境

* Mac
* Python 3.6.2
* windows 10

## Reference

[https://docs.docker.com/](https://docs.docker.com/)

[portainer](https://github.com/portainer/portainer)

[Docker get-started](https://docs.docker.com/get-started/overview/)

[运维和开发视角](https://zhuanlan.zhihu.com/p/93166308)

[DevOps 的分与合](https://cloud.tencent.com/developer/news/604913)

[DevOps - wiki](https://zh.wikipedia.org/wiki/DevOps) 

[DevOps中的作用](https://www.kubernetes.org.cn/7354.html)
