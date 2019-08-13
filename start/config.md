---
description: app.cfg 配置文件解析>
---

# 配置文件解析

> 本文主要介绍app.cfg这个文件的配置及一些参数的解释
>
> kplcloud启动时必须传`app.cfg`文件，所有的参数都通过该文件进行控制，若您是在kubernetes进行部署可以考虑通过ConfigMap的方式挂载进容器里。

### \[server\] 应用配置

| 字段 | 备注 | 其他 |
| :--- | :--- | :--- |
| http\_static | 静态文件路径 | ./static/ |
| http\_proxy | 代理服务地址 | 如果您的环境是隔离的，又需要访问外网的话就填写 |
| logs\_path | 日志文件目录 | 如果填写由会输出日志文件到指定目录 |
| upload\_path | 上传文件的路径 | 发公告时上传资源的路径，如果需要持久化，请配置pvc |
| domain | 网站域名 | https://kplcloud.nsini.com |
| login\_type | 登陆的类型 | 1. ldap 需要在下面的 \[ldap\] 填写相关的ldap地址及配置信息 2. email 邮箱登陆 |
| consul\_kv | 是否启用consul作为配置中心,并可在该平台进行kv的操作 | false，如果为true 可在该平台操作Consul的KV |
| app\_key | 用作加密解密使用的key | 初始化后就不修改 |
| session\_timeout | 登陆超时的时间 | 7200 单位秒 |
| kibana\_url | kibana 地址 |  |
| transfer\_url | tracing 地址 |  |
| grafana\_url | grafana地址 |  |
| heapster\_url | heapster地址 | k8s的cpu、内存等监控数据从这里拿 |
| prometheus\_url | prometheus地址 | 其他监控数据获取源 |
| docker\_repo | 您的镜像仓库地址 | 例如: hub.docker.com |
| service\_mesh | 是否启用servicemesh功能 | 目前兼容istio |
| domain\_suffix | 生成的ingress的后缀 | 例如: .kpaas.nsini.com |
| client_id | OAuth App Client ID | 平台的OAuth App所生成的Client ID |
| client_secret | OAuth App Client Secret | 平台的OAuth App所生成的Client Secret 如有不清楚的可查看 配置Github授权登陆 |
| auth_login | 授权登陆 | 如果有填写那只能进行授权登陆 目前暂时支持Github |
| default_namespace | 授权登陆默认可访问的空间 | Default: app 目前只支持一个 |
| default_role_id | 授权登陆默认所属的我角色 | Default: 4 目前只支持一个 |

### \[cors\] 跨域设置

| 字段 | 备注 | 其他 |
| :--- | :--- | :--- |
| allow | 是否允许跨域请求 | false |
| origin | 允许跨域的地址 | 不能直接写 "\*" |
| methods | 允许跨域的方法 |  |
| headers | 允许跨域的header头信息 |  |

### \[mysql\] mysql配置

| 字段 | 备注 | 其他 |
| :--- | :--- | :--- |
| mysql\_host | 数据库地址 | mysql |
| mysql\_port | 数据库端口 | 3306 |
| mysql\_user | 数据库用户名 |  |
| mysql\_password | 数据库密码 |  |
| mysql\_database | 数据库名 | kplcloud |
| mysql\_debug | 是否开启debug信息 | false |

### \[redis\] redis配置

| 字段 | 备注 | 其他 |
| :--- | :--- | :--- |
| redis\_drive | redis驱动 | 1. cluster: 若为该值, 则访问redis集群; 2. single: 若为该值, 则访问单点redis服务 |
| redis\_hosts | redis地址 | redis IP 地址, 若redis\_drive为cluster,则redis\_hosts需要多个IP用";"隔开例如 redis-0:6379;redis-1:6379;redis-2:6379 |
| mysql\_user | redis连接用户名 |  |
| redis\_password | redis库密码 |  |
| redis\_db | redisDB | 0 |

### [kubernetes\] 配置

| 字段               | 备注                        | 其他                         |
| ------------------ | --------------------------- | ---------------------------- |
| image_pull_secrets | 拉取镜像所需要的secrets名称 | 如果您的环境不需要可以不配置 |



### \[jenkins\] jenkins配置

| 字段 | 备注 | 其他 |
| :--- | :--- | :--- |
| host | jenkins地址 | 如: [http://jenkins:8080](http://jenkins:8080) |
| token | 连接jenkins的token |  |
| user | 构建的用户 | 执行相关jenkins任务的用户 |
| credentials\_id | 安全token | 访问jenkins的凭据, 可以在jenkins的 credentials-&gt;system-&gt;domain进行配置或创建 |

### \[consul\] consul配置

| 字段 | 备注 | 其他 |
| :--- | :--- | :--- |
| consul\_token | consul acl token |  |
| consul\_addr | consul地址 | 如: consul:8500 |

### \[amqp\] RabbitMq配置

| 字段 | 备注 | 其他 |
| :--- | :--- | :--- |
| url | 地址 | 如: amqp://kplcloud:kplcloud@rabbitmq:5672/kplcloud |
| exchange | consul地址 | 如: direct |
| exchange\_type |  | 如: kplcloud-exchange |
| routing\_key |  | 如: kplcloud |

### \[git\] git 仓库配置

| 字段 | 备注 | 其他 |
| :--- | :--- | :--- |
| git\_type | git仓库类型 | 1. gitlab: 使用内部自建的gitlab gitlab的版本需要支持v3 api,如果不支持 您可以自己行加载应用的package 2. github: 使用公共的github |
| git\_addr | 连不知gitlab或github的API地址 | 如: [https://gitlab.com](https://gitlab.com) 或 gitlab.com |
| token | 连接gitlab或github的token | 访问相关git的token 需要所有项目的clone权限 |
| client\_id | consul地址 | 如: github-api 如果使用的是github 由需要用这个在[https://github.com/settings/developers](https://github.com/settings/developers)上查找 |

### \[email\] 邮箱配置

| 字段 | 备注 | 其他 |
| :--- | :--- | :--- |
| smtp\_user | 发送邮箱 |  |
| smtp\_password | 密码 |  |
| smtp\_host | 服务端smtp 地址 |  |

> 邮箱使用的是公司邮箱，有相应用API的,把src/email/client:EmailInterface 实现一遍就好

### \[ldap\] LDAP配置

| 字段 | 备注 | 其他 |
| :--- | :--- | :--- |
| ldap\_host | ldap地址 |  |
| ldap\_port | ldap端口 |  |
| ldap\_base |  |  |
| ldap\_sseSSL | 是否ssl |  |
| ldap\_bindDN |  |  |
| ldap\_bind\_password | 绑定密码 |  |
| ldap\_user\_filter | 过滤用户 | \(userPrincipalName=%s\) |
| ldap\_group\_filter | 过滤组 | \(&\(objectCategory=Group\)\) |
| ldap\_attr | 需要返回的字段 | name;email |

### \[wechat\] 微信相关配置

| 字段 | 备注 | 其他 |
| :--- | :--- | :--- |
| app\_id |  |  |
| app\_secret |  |  |
| token |  |  |
| encoding\_aes\_key |  |  |

### \[msg\] 消息推送配置

| 字段 | 备注 | 其他 |
| :--- | :--- | :--- |
| alarm\_default\_email | 系统告警默认发送的人员 | [solacowa@gmail.com](mailto:solacowa@gmail.com);[i@lattecake.com](mailto:i@lattecake.com) |

### 完成的app.cfg

```ini
; ;[server]
; ;该服务启动的相关参数
; ;http_static: 静态文件目录, 前端的文件会放在这里
; ;http_proxy: 代理服务地址如果需要的话就填
; ;logs_path: 日志文件目录
; ;upload_path: 文件上传目录
; ;domain: 访问域名
; ;login_type: 登陆类型
; ;  1. ldap 需要在下面的 [ldap] 填写相关的ldap地址及配置信息
; ;  2. email 邮箱登陆
; ;consul_kv: 是否启consul kv功能, 如果启用, 将可以在平台上操作consul kv
; ;app_key: 通常用来加密使用
; ;session_timeout: sesstion时长, 单位秒
; ;kibana_url: kibanba地址
; ;grafana_url: grafana地址
; ;heapster_url: heapster 地址
; ;prometheus_url: prometheus地址 http://prometheus.kube-system:9090
; ;docker_repo: 您的镜像仓库地址
; ;service_mesh: false 是否启用service mesh 功能
; ;domain_suffix: 生成对外访问域名的后缀
; ;client_id: 平台的OAuth App所生成的Client ID
; ;client_secret: 平台的OAuth App所生成的Client Secret 如有不清楚的可查看 配置Github授权登陆
; ;auth_login: 授权登陆的平台，目前只支持GitHub
; ;default_namespace: 默认分配的空间名 目前只支持一个
; ;default_role_id: 默认分配的角色ID 目前只支持一个
[server]
app_name = kplcloud
http_static = ./static/
;http_proxy = 
;logs_path = /var/log
upload_path = /tmp/kpaas/upload
domain = https://kplcloud.nsini.com
login_type = email
consul_kv = true
app_key = aw3g4#$YQe0gi-qob-ad424gvp
session_timeout = 7200
kibana_url = http://kibana.kpaas.nsini.com
transfer_url = http://tracing.kpaas.nsini.com
grafana_url = http://grafana.kpaas.nsini.com
prometheus_url = http://prometheus.kube-system:9090
heapster_url = http://heapster.kube-system
docker_repo = hub.kpaas.nsini.com
service_mesh = false
domain_suffix = %s.%s.nsini.com
client_id = 
client_secret = 
auth_login = github
default_namespace = app
default_role_id = 4


; ;[cors]
; ;主要是让服务端支持跨域请求
; ;allow: 是否支持跨域请求
; ;origin: Access-Control-Allow-Origin
; ;methods: Access-Control-Allow-Methods
; ;headers: Access-Control-Allow-Headers
[cors]
allow = true
origin = http://localhost:8000
methods = GET,POST,OPTIONS,PUT,DELETE
headers = Origin,Content-Type,Authorization,x-requested-with,Access-Control-Allow-Origin,Access-Control-Allow-Credentials


; ;[mysql]
; ;mysql相关的配置, 如下所示, 就不需要过多解释了
; ;mysql_host: mysql
; ;mysql_port: 3306
; ;mysql_user: root
; ;mysql_password: 
; ;mysql_database: 
; ;mysql_debug: false
[mysql]
mysql_host = mysql
mysql_port = 3306
mysql_user = kplcloud
mysql_password = 
mysql_database = kplcloud
mysql_debug = true


; ;[redis]
; ;redis可配集群访问和单点访问
; ;redis_drive:
; ;  1. cluster: 若为该值, 则访问redis集群
; ;  2. single: 若为该值, 则访问单点redis服务
; ;redis_hosts: redis IP 地址(redis:6379), 若redis_drive为cluster,则redis_hosts需要多个IP用";"隔开
; ;redis_password: redis auth 密码
; ;redis_db: 在redis_drive为cluster的情况下 redis_db 不需要设置
[redis]
redis_drive = single
redis_hosts = redis:6379
redis_password = 
redis_db = 0

; ;[kubernetes]
; ;kubernetes的一些配置
; ;image_pull_secrets: 拉取镜像所需要的secrets名称
[kubernetes]
image_pull_secrets = regcred

; ;[jenkins]
; ;host: jenins 地址, 如: http://jenkins.devops.idc
; ;token:
; ;user: 执行相关jenkins任务的用户
; ;credentials_id: 访问jenkins的凭据, 可以在jenkins的 credentials/store/system/domain/_/credential进行配置或创建
[jenkins]
host = http://jenkins.kpaas.nsini.com/
token = 
user = 
credentials_id = 

; ;[consul]
; ;consul_token: 连接consul的 token
; ;consul_addr: consul地址 http://consul:8500
[consul]
consul_token = 
consul_addr = http://consul:8500

; ;[amqp]
; ;url: rabbitmq的地址 amqp://kplcloud:kplcloud@rabbitmq:5672/kplcloud
; ;exchange: direct
; ;exchange_type: kplcloud-exchange
; ;routing_key: kplcloud
[amqp]
url = amqp://kplcloud:kplcloud@rabbit:30398/kplcloud
exchange = direct
exchange_type = kplcloud-exchange
routing_key = kplcloud

; ;[git]
; ;git_type:
; ;  1. gitlab: 使用内部自建的gitlab gitlab的版本需要支持v3 api,如果不支持 您可以自己行加载应用的package
; ;  2. github: 使用公共的github
; ;git_addr: git API地址, 例如: http://gitlab.domain.idc/api/v4/  v3 的API暂时不支持
; ;token: 访问相关git的token 需要所有基础的clone权限 0d6f6bc3ecaf97fc87aa2b8bf3e7e7d27667920b
; ;client_id:  如果使用的是github 由需要用这个在https://github.com/settings/developers上查找 可不填
[git]
git_addr = https://gitlab.com
git_type = github
token = balabalabalabiu
client_id = balabalabalabiu

; ;[email]
; ;邮箱使用的是公司邮箱，有相应用API的,把src/email/client:EmailInterface 实现一遍就好
; ;若使用的是SMTP的话，配置下面相关参数就好
; ;smtp_user: 发送邮箱
; ;smtp_password: 密码
; ;smtp_host: 服务端smtp 地址
[email]
smtp_user = 123456@qq.com
smtp_password = 123456
smtp_host = smtp.qq.com:587

; ;[ldap]
; ;ldap的相关配置,根据需要调整
[ldap]
ldap_host = 127.0.0.1
ldap_port = 389
ldap_base = DC=yourdomain,DC=corp
ldap_sseSSL = false
ldap_bindDN = 
ldap_bind_password = 
ldap_user_filter = (userPrincipalName=%s)
ldap_group_filter = (&(objectCategory=Group))
ldap_attr = name;mail

; ;[wechat]
; ;app_id: 微信公众号的应用ID
; ;access_token: 微信公众号的应用access_token
[wechat]
app_id = balabalabalabiubiubiu
app_secret = balabalabalabiubiubiu
token = balabalabalabiubiubiu
encoding_aes_key = balabalabalabiubiubiu

; ;[msg]
; ;消息分发中心，默认接收消息的管理员id
[msg]
alarm_default_email = solacowa@gmail.com;ysz1121@hotmail.com

```

