# 环境变量解析

> 本文主要介绍kplcloud所支持的环境变量的参数解释
>
> kplcloud 启动的各参数的优先级顺序是
>
> cmd args  > 环境变量 >  默认值

### \[server\] 环境变量

| 环境变量                            | 默认值          | 备注                                                         |
| :---------------------------------- | --------------- | :----------------------------------------------------------- |
| KPL_HTTP_PORT                       | `:8080`         | http服务启动端口                                             |
| KPL_SERVER_LOG_PATH                 |                 | 日志文件输出路径，如果为空则会日志则会打开控制台。例: /var/log |
| KPL_SERVER_LOG_NAME                 | `kplcloud.log`  | 日志文件名，日志将按日分割，每天一个日志文件                 |
| KPL_SERVER_LOG_LEVEL                | `debug`         | 日志输出级别，支持五个级别 ，all: 会打印所有日志all,error,warn,info,debug |
| KPL_SERVER_NAME                     | `kplcloud`      | 本服务名称                                                   |
| KPL_SERVER_DOMAIN                   |                 | 您的站点域名  例：https://kplcloud.nsini.com                 |
| KPL_SERVER_DOMAIN_SUFFIX            |                 | 生成域名的后缀  例如: `%s.%s.nsini.com` 第一个 `%s`表示服务名称，第二个`%s`空间名称 |
| KPL_SERVER_UPLOAD_PATH              | `/data`         | 本系统上传文件的路径                                         |
| KPL_SERVER_DEBUG                    | `false`         | 是否开启DEBUG模式                                            |
| KPL_SERVER_SESSION_TIMEOUT          | `7200`          | 登陆Session超时的时间   7200 单位秒                          |
| KPL_SERVER_TERMINAL_SESSION_TIMEOUT | `600`           | WebTermianl超时没有动作自动关闭 600秒                        |
| KPL_SERVER_SELF_QUEUE               | `true`          | 是否本http服务监听topic。  如果开启服务启动将会自动监听处理topic数据，如果http服务和脚本分开请设置为false，可通过命令`kplcloud topicsubscribe -h`查看如何使用 |
| KPL_SERVER_DEFAULT_ROLE             | `develop`       | 新注册用户默认分配的角色                                     |
| KPL_SERVER_DEFAULT_NAMESPACE        | `app`           | 新注册用户默认可访问的空间                                   |
| KPL_SERVER_DEFAULT_CLUSTER          | `c1`            | 新注册用户默认可访问的集群**（请先在集群管理添加好集群之后再进行设置）** |
| KPL_SERVER_KEY                      | `6Id96Zhx1eqD`  | 密码hash的salt **使用平台前请修改，修改完之后不能变更，否则加密salt会失效，无法登录系统** |
| KPL_SERVER_HUB_ADDR                 | `hub.nsini.com` | 镜像仓库的地址。打包后镜像上传的仓库域名                     |
| KPL_SERVER_HTTP_PROXY               |                 | 出网HTTP代理。如果无法访问外网可设置代理: http://10.10.11:1080 |



### \[cors\] 跨域环境变量

| 字段                       | 默认值                                                       | 备注                   |
| :------------------------- | ------------------------------------------------------------ | :--------------------- |
| KPL_ENABLE_CORS            | `false`                                                      | 是否允许跨域请求       |
| KPL_CORS_ALLOW_METHODS     | `GET,POST,PUT,DELETE,OPTIONS`                                | 允许跨域的方法         |
| KPL_CORS_ALLOW_CREDENTIALS | `true`                                                       | 是否允许跨域访问的凭证 |
| KPL_CORS_ALLOW_ORIGINS     | `*`                                                          | 允许跨域的域名         |
| KPL_CORS_ALLOW_HEADERS     | `Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization` | 允许跨域的header头信息 |

### \[mysql\] mysql环境变量

| 字段               | 默认值     | 备注       |
| :----------------- | ---------- | :--------- |
| KPL_DB_DRIVER      | `mysql`    | 数据库驱动 |
| KPL_MYSQL_HOST     | `mysql`    | 数据库地址 |
| KPL_MYSQL_PORT     | `3306`     | 数据库端口 |
| KPL_MYSQL_USER     | `kplcloud` | 数据库用户 |
| KPL_MYSQL_PASSWORD | `kplcloud` | 数据库密码 |
| KPL_MYSQL_DATABASE | `kplcloud` | 数据库名   |

### \[redis\] redis环境变量

| 字段               | 默认值       | 备注                                                         |
| :----------------- | ------------ | :----------------------------------------------------------- |
| KPL_REDIS_HOSTS    | `redis:6379` | redis IP 地址, 多个redis地址用";"隔开例如 redis-0:6379;redis-1:6379;redis-2:6379 |
| KPL_REDIS_PASSWORD |              | redis库密码                                                  |
| KPL_REDIS_DB       | `0`          | redisDB                                                      |
| KPL_REDIS_PREFIX   | `kplcloud`   | redis key 前缀                                               |

### [tracer] Tracer Jaeger环境变量

| 字段                        | 备注          | 其他                                                         |
| --------------------------- | ------------- | ------------------------------------------------------------ |
| KPL_TRACER_ENABLE           | `false`       | 是否使用链路追踪器                                           |
| KPL_TRACER_DRIVE            | `jaeger`      | Tracer驱动                                                   |
| KPL_TRACER_NAME             | `kplcloud`    | Tracer名称                                                   |
| KPL_TRACER_JAEGER_HOST      | `jaeger:6832` | Tracer Jaeger Host                                           |
| KPL_TRACER_JAEGER_PARAM     | `1`           | 1:全采样, 0:不采样                                           |
| KPL_TRACER_JAEGER_TYPE      | `const`       | 采样器的类型 const: 固定采样, probabilistic: 随机取样, ratelimiting: 速度限制取样, remote: 基于Jaeger代理的取样 |
| KPL_TRACER_JAEGER_LOG_SPANS | `false`       | 是否打印日志                                                 |

### \[queue] 消息队列服务环境变量

| 字段                        | 默认值              | 备注                     |
| :-------------------------- | :------------------ | :----------------------- |
| KPL_QUEUE_DRIVE             | `rabbitmq`          | 消息队列系统驱动         |
| KPL_QUEUE_RABBITMQ_HOST     | `rabbitmq`          | RabbitMq队列系统地址     |
| KPL_QUEUE_RABBITMQ_PORT     | `5672`              | RabbitMq队列系统端口     |
| KPL_QUEUE_RABBITMQ_USER     | `kplcloud`          | RabbitMq队列系统用户名   |
| KPL_QUEUE_RABBITMQ_PASSWORD |                     | RabbitMq队列系统密码     |
| KPL_QUEUE_RABBITMQ_VHOST    | `kplcloud`          | RabbitMq队列系统虚拟主机 |
| KPL_QUEUE_RABBITMQ_EXCHANGE | `kplcloud-exchange` | RabbitMq队列系统交换机   |

### \[github\] github环境变量

> 以下两环境变量是在GitHub授权登陆使用的GithuApp 客户端Key，如果不需要GitHub授权有情较则可不填

| 字段                  | 默认值 | 备注                          |
| :-------------------- | :----- | :---------------------------- |
| KPL_GITHUB_CLIENT_ID  |        | 默认连接的GitHub客户端ID      |
| KPL_GITHUB_SECRET_KEY |        | 默认连接的GitHub地址客户端Key |

### \[kubernetes] kubernetes

| 字段                           | 默认值                                | 备注                          |
| :----------------------------- | :------------------------------------ | :---------------------------- |
| KPL_KUBERNETES_SELECTOR_LABELS | `k8s-app,kpl.dev/name,nsini.com/name` | k8s 各类资源的selector labels |

### \[jenkins] Jenkins环境变量

| 字段                 | 默认值           | 备注                |
| :------------------- | :--------------- | :------------------ |
| KPL_JENKINS_HOST     | `http://jenkins` | Jenkins服务器地址   |
| KPL_JENKINS_USERNAME |                  | Jenkins服务器用户名 |
| KPL_JENKINS_PASSWORD |                  | Jenkins服务器密码   |

### \[prometheus\] prometheus环境变量

| 字段                | 默认值                   | 其他                                                         |
| :------------------ | :----------------------- | :----------------------------------------------------------- |
| KPL_PROMETHEUS_HOST | `http://prometheus:9090` | 默认是prometheus监控地址每个集群可单独配置若没有配置则使用该默认参数 |

> 邮箱使用的是公司邮箱，有相应用API的,把src/api/email/service实现一遍就好

### \[email] 邮件环境变量

| 字段               | 默认值 | 备注             |
| :----------------- | :----- | :--------------- |
| KPL_EMAIL_HOST     |        | 邮件服务器地址   |
| KPL_EMAIL_PORT     |        | 邮件服务器端口   |
| KPL_EMAIL_USERNAME |        | 邮件服务器用户名 |
| KPL_EMAIL_PASSWORD |        | 邮件服务器密码   |
| KPL_EMAIL_FROM     |        | 邮件发送者       |

### \[ldap\] LDAP配置

| 字段 | 备注 | 其他 |
| :--- | :--- | :--- |
|      |      |      |
|      |      |      |
|      |      |      |
|      |      |      |
|      |      |      |
|      |      |      |
|      |      |      |
|      |      |      |
|      |      |      |

### \[wechat\] 微信相关配置

| 字段 | 备注 | 其他 |
| :--- | :--- | :--- |
|      |      |      |
|      |      |      |
|      |      |      |
|      |      |      |
|      |      |      |
|      |      |      |

### \[msg\] 消息推送配置

| 字段 | 备注 | 其他 |
| :--- | :--- | :--- |
|      |      |      |
|      |      |      |

### 完成的环境变量

```bash
# 本应用环境变量
KPL_HTTP_PORT=:8080

KPL_DB_DRIVER=mysql
KPL_MYSQL_HOST=mysql
KPL_MYSQL_PORT=3306
KPL_MYSQL_USER=kplcloud
KPL_MYSQL_PASSWORD=kplcloud
KPL_MYSQL_DATABASE=kplcloud

KPL_REDIS_HOSTS=redis:6379
KPL_REDIS_PASSWORD=
KPL_REDIS_DB=5
KPL_REDIS_PREFIX=kplcloud
KPL_REDIS_PREFIX=

KPL_SERVER_LOG_PATH=
KPL_SERVER_LOG_LEVEL=all
KPL_SERVER_LOG_NAME=kplcloud.log
KPL_SERVER_NAME=kplcloud
KPL_SERVER_DOMAIN=
KPL_SERVER_DOMAIN_SUFFIX=%s.%s.nsini.com
KPL_SERVER_UPLOAD_PATH=/data
KPL_SERVER_DEBUG=true
KPL_SERVER_SESSION_TIMEOUT=86400
KPL_SERVER_TERMINAL_SESSION_TIMEOUT=600
KPL_SERVER_SELF_QUEUE=true
KPL_SERVER_DEFAULT_ROLE=develop
KPL_SERVER_DEFAULT_NAMESPACE=app
KPL_SERVER_DEFAULT_CLUSTER=c5
KPL_SERVER_KEY=wOu8eOYZwUaF
KPL_SERVER_HUB_ADDR=hub.nsini.com
KPL_SERVER_HTTP_PROXY=

KPL_ENABLE_CORS=false
KPL_CORS_ALLOW_METHODS=GET,POST,PUT,DELETE,OPTIONS
KPL_CORS_ALLOW_HEADERS=Origin,Content-Type,Authorization,mode,cors,x-requested-with,Access-Control-Allow-Origin,Access-Control-Allow-Credentials,X-Token,Token,Tag,X-Tag,Upgrade,Sec-WebSocket-Version,Sec-WebSocket-Key,Sec-WebSocket-Extensions,Connection,XMLHttpRequest,withCredentials,include
KPL_CORS_ALLOW_CREDENTIALS=true
KPL_CORS_ALLOW_ORIGINS=*

KPL_TRACER_ENABLE=false
KPL_TRACER_DRIVE=jaeger
KPL_TRACER_NAME=kplcloud
KPL_TRACER_JAEGER_HOST=jaeger:6832
KPL_TRACER_JAEGER_PARAM=1
KPL_TRACER_JAEGER_TYPE=const
KPL_TRACER_JAEGER_LOG_SPANS=false

KPL_QUEUE_DRIVE=rabbitmq
KPL_QUEUE_RABBITMQ_HOST=rabbitmq
KPL_QUEUE_RABBITMQ_PORT=5672
KPL_QUEUE_RABBITMQ_USER=kplcloud
KPL_QUEUE_RABBITMQ_PASSWORD=
KPL_QUEUE_RABBITMQ_VHOST=kplcloud
KPL_QUEUE_RABBITMQ_EXCHANGE=kplcloud-exchange

KPL_GITHUB_CLIENT_ID=
KPL_GITHUB_SECRET_KEY=

KPL_KUBERNETES_SELECTOR_LABELS=k8s-app,kpl.dev/name,nsini.com/name

KPL_JENKINS_HOST=http://jenkins
KPL_JENKINS_USERNAME=
KPL_JENKINS_PASSWORD=

KPL_PROMETHEUS_HOST=http://prometheus:9090

KPL_EMAIL_HOST=
KPL_EMAIL_PORT=
KPL_EMAIL_USERNAME=
KPL_EMAIL_PASSWORD=
KPL_EMAIL_FROM=

```

