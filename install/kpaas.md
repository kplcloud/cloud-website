# 安装kpaas

```
$ git clone github.com/nsini/kplcloud.git
```

## Docker

```
$ docker pull kpaas
```

## kubernetes

基础服务安装: [install.md](README.md)

若您的其他服务都已经准备好了，可以直接执行以下命令在kubernetes上进行部署开普勒云平台。

```
$ kubectl apply -f install/kubernetes/kpaas/configmap.yaml
$ kubectl apply -f install/kubernetes/kpaas/deployment.yaml
$ kubectl apply -f install/kubernetes/kpaas/service.yaml
$ kubectl apply -f install/kubernetes/kpaas/ingress.yaml
```



如果您有私有仓库，记得在master节点上执行一下:

```bash
$ kubectl create secret generic regcred --from-file=.dockerconfigjson=/root/.docker/config.json --type=kubernetes.io/dockerconfigjson -n default
```

在每个namespace下都创建一下，这样k8s就有权限拉取私有仓库的镜像了

Deployment需要把imagePullSecrets加上：

```yaml
imagePullSecrets:
- name: regcred
```

