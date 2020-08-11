
## Portainer 

### 网站

- [官网](https://www.portainer.io/)  


### 安装
> [使用Docker安装Portainer](https://www.portainer.io/installation/)
Portainer由两个元素组成，即Portainer服务器和Portainer代理。这两个元素都作为轻量级Docker容器在Docker引擎或Swarm集群中运行。由于Docker的性质，存在许多可能的部署方案，但是，我们在下面详细介绍了最常见的方案。请使用与您的配置匹配的方案（或者，如果未列出您的配置，请参阅portainer.readthedocs.io以获取其他选项）。

> 请注意，使用Swarm时建议的部署模式是使用Portainer代理。

> 仅在Linux（CentOS 7和8，Ubuntu 16.04.6 LTS，18.04.4 LTS和20.04 LTS）和Windows（Win 10> 1909和Server 2019> 1909）上运行时才正式支持Portainer。Portainer未在MacOS或任何其他OS或OS系列/版本上进行测试。

> 在独立的LINUX Docker主机 /单节​​点群集集群（或以“ Linux容器”模式运行的Windows 10 Docker主机）上部署Portainer Server 。
使用以下Docker命令部署Portainer服务器；请注意，在独立主机上不需要代理，但是如果使用代理，它会提供其他功能（请参阅下面的portainer和代理场景）：
```bash
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```

- 您只需要使用浏览器访问运行portainer的Docker引擎的9000端口。

- 注意：端口9000是Portainer用于UI访问的常规端口。EDGE代理仅将端口8000用于反向隧道功能。如果您不打算使用边缘代理，则不需要公开端口8000

- 注意：-v /var/run/docker.sock:/var/run/docker.sock选项只能在Linux环境中使用。

> 在独立的WINDOWS Docker主机（运行Windows容器）上部署Portainer Server –注意必须是Windows 1909或更高版本。
```bash
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 --name portainer --restart always -v \\.\pipe\docker_engine:\\.\pipe\docker_engine -v portainer_data:C:\data portainer/portainer
```


### 使用
- [https://www.portainer.io/portainer-ce/](https://www.portainer.io/portainer-ce/)


