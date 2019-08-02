# 安装Consul集群

> 如果您的独立的Consul集群或不想使用Consul的话，不需要执行以下命令。 以下命令是将docker版的consul集群安装在您的kubernetes集群上前提是前必须有持久化存储。

如果您还没有初始化持久化存储的，请在这里[持久化存储](storage.md)配置好存储类再安装consul集群。

### 安装

```text
$ kubectl apply -f install/kubernetes/consul/configmap.yaml
$ kubectl apply -f install/kubernetes/consul/service.yaml
$ kubectl apply -f install/kubernetes/consul/statefulset.yaml
$ kubectl apply -f install/kubernetes/consul/ingress.yaml
```

咱们采用的是StatefulSet的方式部署集群，若您已经有了持久化的存储类，将storageClassName修改成您的存储类包就好。

![](http://source.qiniu.cnd.nsini.com/images/2019/07/09/73/29/20190723-1344eae741d09fdf2d10b1ba73e09287.jpeg?imageView2/2/w/1280/interlace/0/q/100)

[ingress.yaml](../../install/kubernetes/consul/ingress.yaml) 提供对外访问的入口

[configmap.yaml](../../install/kubernetes/consul/configmap.yaml) consul cluster server的配置文件

### 注释

这个kubernetes亲和度问题您可能需要关注一下，如果您的kubernetes是单点，请使用以下注释掉的代码。否由会无法起动服务。

```text
      affinity:
        podAntiAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            - labelSelector:
                matchLabels:
                  app: consul
                  component: server
              topologyKey: kubernetes.io/hostname
#          # 单节点用这个
#          preferredDuringSchedulingIgnoredDuringExecution:
#            - wight: 100
#              podAffinityTerm:
#                topologyKey: kubernetes.io/hostname
```

