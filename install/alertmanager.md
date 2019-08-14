# 安装配置alertmanager

> Alertmanager 主要是接收来自prometheus 的alert数据

## 安装

可以独立安装不使用Docker，以下案例是部署在kubernetes集群上。

```bash
$ kubectl apply -f install/kubernetes/alertmanager/deployment.yaml
$ kubectl apply -f install/kubernetes/alertmanager/ingress.yaml
$ kubectl apply -f install/kubernetes/alertmanager/configmap.yaml
$ kubectl apply -f install/kubernetes/alertmanager/service.yaml
```

## 相关配置

这里采用webhook的方式将报警信息发送到kplcloud平台，kplcloud接收数据处理并入rabbitmq。

```yaml
apiVersion: v1
data:
  config.yml: |-
    global:

    route:
      group_by: ['alertname', 'cluster', 'service']
      group_wait: 30s
      group_interval: 5m
      repeat_interval: 10m
      receiver: webhook

    receivers:
    - name: 'webhook'
      webhook_configs:
      - url: 'http://kplcloud:8080/public/prometheus/alerts'
kind: ConfigMap
metadata:
  name: alertmanager
```

kplcloud处理完的数据最终根据相应的规则推送给相应的用户及平台等。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/c8/23/5f/20190814-1a51b4e86ecefd405ba94232237c888d.jpeg?imageView2/2/w/1280/interlace/0/q/100)