
### Docker Hub （仓库）

- 官方仓库：[https://hub.docker.com/](https://hub.docker.com/) 


### 命令

- Search: [https://docs.docker.com/engine/reference/commandline/search/](https://docs.docker.com/engine/reference/commandline/search/)

- Login: [https://docs.docker.com/engine/reference/commandline/login/](https://docs.docker.com/engine/reference/commandline/login/)

- Tag: [https://docs.docker.com/engine/reference/commandline/tag/](https://docs.docker.com/engine/reference/commandline/tag/)

- Push: [https://docs.docker.com/engine/reference/commandline/push/](https://docs.docker.com/engine/reference/commandline/push/)

- Pull: [https://docs.docker.com/engine/reference/commandline/pull/](https://docs.docker.com/engine/reference/commandline/pull/)


### Demo
```bash
# demo
docker login
docker tag oudream/ubuntu-hello2 oudream/ubuntu-hello2:1.0.1
docker push oudream/ubuntu-hello2:1.0.1
docker search oudream/ubuntu-hello2:1.0.1
docker pull oudream/ubuntu-hello2:1.0.1
```
