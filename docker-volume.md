
### Docker Volume

```bash

docker run -it -v /home/oudream/data:/data ubuntu /bin/bash

```

```bash

docker run --name mysql1 -v /home/oudream/mydata:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD="Aa.123456" mysql:5.7

```
