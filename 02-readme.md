### Docker容器的由来（历史）

- 很久以前
    - 2008年，Solomon Hykes 和他的朋友 Kamel Founadi、Sebastien Pahl 共同创立了一家名为 DotCloud 的公司，目标是利用一种叫做容器的技术来创建他们称作是“大规模的创新工具”：任何人都可以使用的编程工具。
    - 2010年，dotCloud获得了创业孵化器Y Combinator的支持，并开始吸引到一些真正的投资，在接下来的3年中，dotCloud内部孵化了一款名为Docker的产品。
    
- 2013年
    - 2013 年 3 月 Docker 创始人 Solomon Hykes 在 PyCon 大会上的演讲中首次公开介绍了 Docker 这一产品。在2013 年 PyCon 大会之后，Docker 的创新式镜像格式以及容器运行时迅速成为社区、客户和更广泛行业的实际标准和基石。Docker 的强大之处在于它通过可移植的形式和易于使用的工具在应用程序和基础设施之间创造了独立性。其结果是，Docker将容器技术大众化，并解决了困扰数百万开发人员的“matrix from hell”问题，使容器技术成为主流。
    - 2013年3月20日，dotCloud发布了 Docker 的首个版本，并将Docker源码进行开源。https://github.com/docker/
    - 2013年9月 红帽公司成为Docker的主要合作伙伴，利用Docker来驱动他的OpenShift云业务。随后，谷歌、亚马逊以及DigitalOcean也迅速的在其云服务平台提供了Docker的支持。主流云厂商的加入，加速Docker的发展进度。
    - 随着Docker技术的开源，此项技术能够将Linux容器中的应用代码打包并轻松的在服务器之间迁移，Docker技术瞬时的风靡了全球，2013年底DotCloud Inc则更名为Docker Inc，并全力的主攻到Docker项目开发中。    
  
  
### 传统的软件产品开发一般是这样的：
```text
1、确定产品定位和需求，确定首次迭代的范围。
2、制作界面原型。
3、技术选型，然后根据技术选型为每个开发者搭建开发环境和技术栈，例如 Java 环境、Python 环境、Ruby 环境、数据库、中间件等等。
4、构建基础技术框架和服务，包括日志、存储、消息、缓存、搜索、数据源、集群扩展等等。
5、模拟用户容量，构建测试环境。
6、开始编写真正的业务代码，实现产品功能。
7、迭代开发/测试，生生不息，周而复始，直到头发掉光为止……
``` 
- 如果采用完善的 PaaS 平台，可以直接忽略3、4、5三个步骤。
- 无论你选择哪个技术栈，PaaS 都会为你提供相关的配套设置，包括语言环境、运行环境、存储和各种基础服务。
- dotCloud 不仅支持诸如 PHP、MySql 等传统技术框架，还包括 Node.js、MongoDB 等新兴技术。  
- 基于 dotCloud 提供的开发工具和技术框架，你可以直接使用 dotCloud 的 SDK 编写代码和构建业务服务，并在联网的时候把这些代码推送到云端，实现自动部署和测试。
 
dotCloud 把需要花费大量时间的手工工作和重复劳动抽象成组件和服务，并放到了云端，  
另外，它还提供了各种监控、告警和控制功能，方便开发者管理和监控自己的产品。  
dotCloud 最初运行在 Amazon 的 EC2 上，不过由于 dotClout 高度的抽象层次，理论上 dotCloud 可以运行在各种各样的云服务上面（我猜这就是 Docker 的功劳）。
  
### 参考
[Dotcloud - 维基](https://zh.wikipedia.org/wiki/Dotcloud)  
[Docker的历史与发展](https://zhuanlan.zhihu.com/p/105331409)  
[Docker简介以及Docker历史](http://c.biancheng.net/view/3118.html)  
[Docker 传奇之 dotCloud](https://zhuanlan.zhihu.com/p/19913119)  
[Docker容器的由来](https://www.yisu.com/zixun/22268.html)    
[Docker的发展历程详述](https://www.linuxidc.com/Linux/2018-09/153977.htm)
  
