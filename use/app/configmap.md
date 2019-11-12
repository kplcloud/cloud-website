# 配置字典

> 项目配置信息信息可以通过配置字典来实现。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/a5/aa/87/20190827-e1cb222c136c7f038e042d61aada5136.jpeg)



可以根据项目需要添加 `key`/`value`

例如配置日志信息，key为 `filebeat.yml` 详细 `yaml` 信息如下(`可根据项目日志规则更改`)：

![](http://source.qiniu.cnd.nsini.com/images/2019/08/68/dd/84/20190827-856199f3d35b454184bc6fb9ddc687fc.jpeg)



## 挂载配置文件

除了使用Consul作为配置中心外，您也可以通过挂载文件的方式来实现配置文件的分离。

