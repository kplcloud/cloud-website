# Redis 单点 

> 为了方便给大家演示，redis也使用的docker版本部署在kubernetes集群上，真实环境请使用独立的redis服务器或集群

如果您还没有初始化持久化存储的，请在这里[持久化存储](storage.md)配置好存储类再安装Redis服务。

## 安装

```
$ kubectl apply -f install/kubernetes/redis/statefulset.yaml
$ kubectl apply -f install/kubernetes/redis/service.yaml
$ kubectl apply -f install/kubernetes/redis/configmap.yaml
```

redis的配置相关信息写在configmap里面 [statefulset.yaml](../../install/kubernetes/redis/statefulset.yaml)

官方redis默认的存在/data目录，所以我们需要将持久化存储目标配置在/data目录下。
