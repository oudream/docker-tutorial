
### Docker Volume

```shell script
docker volume --help
```

### volume command
```text

docker volume COMMAND

Manage volumes

Commands:
  create      Create a volume
  inspect     Display detailed information on one or more volumes
  ls          List volumes
  prune       Remove all unused local volumes
  rm          Remove one or more volumes

Run 'docker volume COMMAND --help' for more information on a command.


```

### demo
- 創建
```shell script
docker volume create my-volume-2
docker volume inspect my-volume-2
```
```text
[
    {
        "CreatedAt": "2020-08-25T10:09:14+08:00",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/my-volume-2/_data",
        "Name": "my-volume-2",
        "Options": {},
        "Scope": "local"
    }
]
```

- 使用
```shell script
# docker run -d --rm ubuntu:18.04 /bin/sh -c "while sleep 2;do printf aaabbbccc134\\n; done;"

# 1
docker run --name=hello-volume1 -v my-volume-2:/my-v-2-1 -d ubuntu:18.04 /bin/sh -c "while sleep 2;do printf my-v-2-1...\\n; done;"

# 2
docker run --name=hello-volume2 -v my-volume-2:/my-v-2-2 -d ubuntu:18.04 /bin/sh -c "while sleep 2;do printf my-v-2-2...\\n; done;"

```
