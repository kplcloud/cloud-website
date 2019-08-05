# 安装ELK

> Logstash、ES对机器要的求比较高，建议使用独立的ELK集群负责日志的采集分析

如果您非要使用Docker版的elk的并且部署在Kubernetes集群里，如果还没有初始货持久化存储，先初始化持久化存储的，请在这里[持久化存储](storage.md)配置好存储类再安装相关服务服务。

ELK主要包含Elasticsearch、Logstash、Kibana几个服务，kibana和logstash可以做在Deployment，全ES需要持久化，因为日志数据是存在ES上的。

```text
$ kubectl apply -f install/kubernetes/elk/elasticsearch.yaml
$ kubectl apply -f install/kubernetes/elk/logstash.yaml
$ kubectl apply -f install/kubernetes/elk/kibana.yaml
$ kubectl apply -f install/kubernetes/elk/ingress.yaml
```

## 相关配置

