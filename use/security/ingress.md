# 入口 Ingress

> 在服务配置好之后，可能需要外部来访问该服务，这时候就要用到 `Ingress` 来配置网关。

### Ingress管理 （菜单栏 > 安全管理 > 入口/API列表）

列表展示当前业务空间下所有的 **Ingress** 配置信息。多个配置项信息会全部展示在列表中。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/9e/a8/04/20190826-393ed225de4b40360cd73bc0a8a9e86d.jpeg)

点击列表中的 `项目名称` 可以查看当前项目配置的 `yaml` 详情信息。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/d9/9e/f3/20190823-8755bea82c0534b0f34880939e9d9d19.jpeg)



创建 **Ingress** 仅支持选择已经填写完整并且部署好的项目，默认会生成域名：`项目名.空间名称.xxx.com`  

支持多个项目配置项添加，并且所有配置项均可以按照自己的需求添加。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/92/1f/ef/20190826-555ef9b42281f3f9eadaa64f1fc9208e.jpeg)