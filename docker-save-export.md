
### docker save和docker export的区别：
- docker save保存的是镜像（image），docker export保存的是容器（container）；
- docker load用来载入镜像包，docker import用来载入容器包，但两者都会恢复为镜像；
- docker load不能对载入的镜像重命名，而docker import可以为镜像指定新名称。
