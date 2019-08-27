# 相关服务的安装说明

> 建议将与开普勒相关的服务独立到一个专有的 Namespace下，您可以执行以下命令创建该空间



```bash
$ kubectl create namespace kpaas
```

或执行以下命令 ：

```bash
$ kubectl apply -f install/kubernetes/namespace.yaml
```



- [Namespace](namespace.md)
- [配置持久化存储](storage.md)
- [安装Redis 单点](redis.md)
- [安装Consul集群](consul.md)
- [安装RabbitMQ服务](rabbitmq.md)
- [安装Mysql服务](mysql.md)
- [安装ELK](elk.md)
- [安装Jenkins](jenkins.md)
- [安装Harbor仓库](harbor.md)
- [安装Prometheus](prometheus.md)
- [安装AlertManager](alertmanager.md)
- [安装kplcloud](kpaas.md)