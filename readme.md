
## Docker Tutorial

## 目录
- [Docker 解决了什么问题](./01-readme.md)

- [Docker 历史](./02-readme.md)

- [Docker 教程](./03-readme.md)

- [Docker 原理](./04-readme-LXC-cgroups-namespaces.md)

- [Docker分层存储-AUFS](./Docker分层存储-AUFS.md)

- [Dockerfile 教程及实例](./dockerfile)

- [Docker Compose 教程及实例](./docker-compose)


## DOC
- [官网 Docker Reference](https://docs.docker.com/reference/)

- [官网 Docker command line](https://docs.docker.com/engine/reference/commandline/cli/)

- [官网 Dockerfile](https://docs.docker.com/engine/reference/builder/)

- [官网 Docker Compose](https://docs.docker.com/compose/compose-file/)

- [官网 Docker Api](https://docs.docker.com/engine/api/)


## 实验
- [官方 play-with-docker Web](https://www.docker.com/play-with-docker)

- [官方 play-with-docker Host](https://labs.play-with-docker.com/)

- [在线学习平台 katacoda](https://www.katacoda.com/learn)


### 作业
    1）、選擇一門自己喜好的技術（Java、Node.js、Python、Golang等）來構建HTTP伺服器
    2）、編寫 Dockerfile 來構建鏡像
    3）、對鏡像進行打包導出；【*】
    4）、運行鏡像，要求如下：
        4.1）、容器命名格式為（“自己英文名”-httpserver)；
        4.2）、容器停止運行後，自動刪除容器檔；
        4.3）、在後臺運行；
        4.4）、容器停止運行後，自動刪除容器檔；
        4.5）、端口映射宿主機的唯一端口號；
        4.6）、服務的數據持久化存儲（包括服務的配置數據、web根目錄、服務日誌等）；
        4.7）、無論退出狀態如何，Docker守護程式將嘗試無限期重啟容器；；【*】
    
    【*】：可選項，可以不做
