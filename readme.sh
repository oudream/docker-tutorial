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
