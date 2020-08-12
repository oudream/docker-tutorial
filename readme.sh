#!/usr/bin/env bash

docker run -d --rm alpine /bin/sh -c "while sleep 2;do printf aaabbbccc134\\n; done;"
docker run -it --rm alpine "/bin/bash while sleep 2;do printf '\33[0n'; printf 'abc'; done;"

docker run --volumes-from dbdata -v $(pwd):/backup ubuntu:18.04 tar cvf /backup/backup.tar /dbdata


docker run -d --rm ubuntu /bin/sh -c "while sleep 2;do printf aaabbbccc134\\n; done;"

mkdir /home/oudream && cd /home/oudream

### docker export
# docker export [OPTIONS] CONTAINER
# https://docs.docker.com/engine/reference/commandline/export/
#    docker export <ContainerId> > latest.tar
#    docker export --output="latest.tar" <ContainerId>
#    docker export -o latest.tar <ContainerId>
docker export 21b -o ubuntu-hello1.tar


### docker import
# docker import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]
# https://docs.docker.com/engine/reference/commandline/import/
docker import ubuntu-hello1.tar oudream/ubuntu-hello1
docker run -d --rm oudream/ubuntu-hello1 /bin/sh -c "while sleep 2;do printf aaabbbccc134\\n; done;"
docker run -d --rm ubuntu:18.04 /bin/sh -c "while sleep 2;do printf aaabbbccc134\\n; done;"


### docker commit
# docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
# https://docs.docker.com/engine/reference/commandline/commit/
docker commit 21b oudream/ubuntu-hello2


### docker save
# docker save [OPTIONS] IMAGE [IMAGE...]
# https://docs.docker.com/engine/reference/commandline/save/
docker save -o ubuntu-hello2.tar oudream/ubuntu-hello2


### docker load
# docker load [OPTIONS]
docker load -i ubuntu-hello2.tar


### portainer
docker volume create portainer_data
docker run -d -p 8000:8000 -p 80:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer


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
