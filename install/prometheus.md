# Prometheus安装

> 如果还没有初始货持久化存储，先初始化持久化存储的，请在这里[持久化存储](storage.md)配置好存储类再安装相关服务服务。

Prometheus 需要将数据存在本地，所以需要挂载持久化存储。

```bash
$ kubectl apply -f install/kubernetes/prometheus/deployment.yaml
$ kubectl apply -f install/kubernetes/prometheus/ingress.yaml
$ kubectl apply -f install/kubernetes/prometheus/configmap.yaml
$ kubectl apply -f install/kubernetes/prometheus/serviceaccount.yaml
$ kubectl apply -f install/kubernetes/prometheus/service.yaml
$ kubectl apply -f install/kubernetes/prometheus/persistentvolumeclaim.yaml
```



## 相关配置

configmap.yaml文件有五个文件：

- *etcd3.rules.yml*
- *kube-state-metrics_rules.yml*
- *kubelet_rule.yml*
- *kubernetes_rule.yml*
- *prometheus.yml*

在prometheus里引用了上面4个文件。如果您有新的规则可以在这里增加。

在prometheus.yml 文件里有配置 alerting 目前默认发身 alertmanager:9093 ，若您有自己的报警管理平台，修改该地址就行，若还想使用alertmanager的话请看[安装AlertManager](alertmanager.md)