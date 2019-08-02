# RabbitMQ服务 

> 为了方便给大家演示，rabbitmq也使用的docker版本部署在kubernetes集群上，真实环境请使用独立的rabbitmq服务器

如果您还没有初始化持久化存储的，请在这里[持久化存储](storage.md)配置好存储类再安装rabbitMQ服务。

## 安装

```
$ kubectl apply -f install/kubernetes/rabbitmq/statefulset.yaml
$ kubectl apply -f install/kubernetes/rabbitmq/service.yaml
```


有状态服务: [statefulset.yaml](../../install/kubernetes/rabbitmq/statefulset.yaml)
入口: [ingress.yaml](../../install/kubernetes/rabbitmq/ingress.yaml)

kpass在rabbitmq里需要创建:

- Vhost: kplcloud
- Exchanges: kplcloud-exchange
- User: kplcloud
- RoutingKey: kplcloud

![](http://source.qiniu.cnd.nsini.com/images/2019/07/96/fe/b6/20190723-82ddfef524db68edb29dc7f4fe5962c7.jpeg?imageView2/2/w/1280/interlace/0/q/100)