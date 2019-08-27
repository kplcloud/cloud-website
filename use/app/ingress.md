### Ingress管理 （菜单栏 > 安全管理 > 入口/API列表）

列表展示当前业务空间下所有的 **Ingress** 配置信息。多个配置项信息会全部展示在列表中。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/9e/a8/04/20190826-393ed225de4b40360cd73bc0a8a9e86d.jpeg)

点击列表中的 `项目名称` 可以查看当前项目配置的 `yaml` 详情信息。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/d9/9e/f3/20190823-8755bea82c0534b0f34880939e9d9d19.jpeg)



创建 **Ingress** 仅支持选择已经填写完整并且部署好的项目，默认会生成域名：`项目名.空间名称.xxx.com`  

支持多个项目配置项添加，并且所有配置项均可以按照自己的需求添加。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/92/1f/ef/20190826-555ef9b42281f3f9eadaa64f1fc9208e.jpeg)

# 生成入口地址

> 若一个http应用需要外部能访问进来怎么办？Kubernetes提供了一个种方案叫作Ingress。
>
> 在这里可以快速的生成一个Ingress

## 生成地址

生成地址之前请先确认您的配置文件[app.cfg](../../start/config.md)下的[server]参数`domain_suffix = %s.%s.nsini.com`，也就是您要生成的对外的域名后缀。

目前的规则是 {应用名}.{空间名}.{域名} 可根据您的环境自行调整。

您需要将*.nsini.com解析到对应的端口。

我们这是通过haproxy代理80端口到ingresscontroller开放的NodePort端口上。

实际生产应该是高可用的方案，您可以参考[切换服务模式](mesh.md)的流程图进行搭建。

在“应用详情”下面找到“外部地址”卡片。点击**"添加按钮"**弹出对话框，点击**“确定”**一个对外的地址就生成了

![](http://source.qiniu.cnd.nsini.com/images/2019/08/37/7e/8c/20190823-8891fa9c5bf4cf2987e991657ec373ed.jpeg?imageView2/2/w/1280/interlace/0/q/70)