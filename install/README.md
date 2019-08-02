# 相关服务的安装说明

> 建议将与开普勒相关的服务独立到一个专有的 Namespace下，您可以执行以下命令创建该空间



```bash
$ kubectl create namespace kpaas
```

或执行以下命令 ：

```bash
$ kubectl apply -f install/kubernetes/namespace.yaml
```



- [安装持久化存储](storage.md)
- [安装consul集群](consul.md)
- [安装单点redis](redis.md)
- [安装单点rabbitMQ](rabbitmq.md)
- [安装单点mysql](mysql.md)
- [安装ELK](elk.md)
- [安装Prometheus]()
- [安装Jenkins](jenkins.md)
- [安装kpaas](kppas.md)

