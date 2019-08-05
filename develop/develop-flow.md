# 开发流程

## 开发kplcloud

若您想对kplcloud进行二次开发，可以将代码克隆在您本地。

```bash
$ git clone github.com/kplcloud/kplcloud.git
```

该项目需要go 1.12.x 的版本支持，所以确保您本地的golang版本是1.12以上。

因为众所周知的一些原因，咱们国内可能无法访问一些资源，所以你还需要配置一个环境变量：

```bash
$ export GOPROXY=https://goproxy.io
```

**启动**

```text
$ make run
```

![](http://source.qiniu.cnd.nsini.com/images/2019/08/9f/96/8c/20190802-59d5b707bb9bc63d80b20bc09609f05d.jpeg?imageView2/2/w/1280/interlace/0/q/70)

**config.yaml**

在kubernetes master节点上找到，或您重新生成一个。

**app.cfg**

app.cfg文件的配置请看[config.md](../start/config.md)

## Docker

> 本地直接Docker启动，请参考以下命令

```bash
$ docker pull kplcloud/kplcloud:latest
$ docker run -it --rm -p 8080:8080 kplcloud/kplcloud:latest -v app.cfg:/etc/kplcloud/app.cfg -v config.yaml:/etc/kplcloud/config.yaml
```

启动成功后浏览器输入 localhost:8080 就可以开始使用开普勒平台了。

## kubernetes

> 建议将与开普勒相关的服务独立到一个专有的 Namespace下，您可以执行以下命令创建该空间

```bash
$ kubectl create namespace kpaas
```

或执行以下命令 ：

```bash
$ kubectl apply -f install/kubernetes/namespace.yaml
```

基础服务安装: [install.md](https://github.com/icowan/cloud-website/tree/8f255be9ee74e1dcb3bab1373025dc200a1b89f5/install/README.md)

若您的其他服务都已经准备好了，可以直接执行以下命令在kubernetes上进行部署开普勒云平台。

```text
$ kubectl apply -f install/kubernetes/kpaas/configmap.yaml
$ kubectl apply -f install/kubernetes/kpaas/deployment.yaml
$ kubectl apply -f install/kubernetes/kpaas/service.yaml
$ kubectl apply -f install/kubernetes/kpaas/ingress.yaml
```

![image-20190802133902218](http://source.qiniu.cnd.nsini.com/images/2019/08/19/4a/6f/20190802-7643b01efd1ef58f6b393e4d4ad19e8e.jpeg?imageView2/2/w/1280/interlace/0/q/70)

## docker-compose

配置文件调整好后执行以下命令直接启动：

```bash
$ cd install/docker-compose/
$ docker-compose up
```

