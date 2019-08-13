# 切换服务模式

> 服务模式切换比较麻烦，需要您的Kubernetes支持，目前我们使用的是istio的方案，也就是说您需要在你的kubernetes上安装istio的相关服务，并且在我们的模版管理将istio所需要的几个模版配置上。才能开启此功能。

如果您没有安装Istio，可跳过此章。



## 依赖

在**"模版管理"**菜单找到**Gateway**、**VritualService**、**InitContainer**、**IstioProxy**这几个模版，根据自己环境的情况进行调整。

- Gateway: 本平台设计的模式是一个Namespace所对应一个Gateway，多个Namespace空间就会有多个Gateway，VirtualService选择的是本Namespace下的Gateway。

- VirtualService: 在生成应用的对外访问入口时与Ingress一起生成。

使用过Istio的同学应该都知道，要实现Istio所提供的相关功能需要在Pods里注入两个容器，一个是`proxy_init`，另一个是`proxyv2`

- InitContainer: 模版是是初始化设置的yaml，比如将流量通过iptables的方式转发给 proxy
- IstioProxy: 模版就是将pods的所有流量代理的yaml

## 流程

下图是我们架构流量进入到我们容器所图：

![](http://source.qiniu.cnd.nsini.com/images/2019/08/bd/11/9b/20190813-2b04ec201162b3819896abc011bbd649.jpeg?imageView2/2/w/1280/interlace/0/q/70)

- DNS 将域名解析到VIP
- VIP 将80的流量转发边缘节点的31380端口（这个是IstioIngressGateway控制器的Service的NodePort）
- 前面我们所说过每个Namespace都会有至少一个对应的Gateway，Gateway的hosts就是xxx.{namespace}.xxx.com
- VirtualService里的destination.host 就是Service的名称。

以上是kplcloud平台的流程，如果您有需要调整的，只需要修改模版就好，不需要调整代码。



## 一键切换

如下图，在应用详情页面选择**“模式”**按钮，在弹出的对话框中选择"Service Mesh"选项目，后点击提交后Pods会自动重起。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/56/08/f8/20190808-14bdbef0b93087c9f0cfc11308656b00.jpeg?imageView2/2/w/1280/interlace/0/q/70)

*你需要在app.cfg文件开起ServiceMesh功能*

```ini
[server]
service_mesh = true
```

