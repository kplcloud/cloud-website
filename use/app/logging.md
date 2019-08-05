# 日志采集



## 日志采集配置

在应用详情页中间有一个叫作“日志采集”的模块

![](http://source.qiniu.cnd.nsini.com/images/2019/08/e3/80/b8/20190805-031dc52e96028bcebe3c3daa80ae3f55.jpeg?imageView2/2/w/1280/interlace/0/q/70)

点击右边的“添加”按钮，在弹出的对话框中选择日志的路径及正则规则

![](http://source.qiniu.cnd.nsini.com/images/2019/08/ac/4c/70/20190805-1337737ec12d0f8d72526cf34c8acc08.jpeg?imageView2/2/w/1280/interlace/0/q/70)

1. 文件路径：你日志文件的位置
2. 日志规则：如果没有特殊需求的话默认就好

提交后服务会自动重启动。



## 日志采集

如果配置了上面采集器，那么它会向服务所在的Pod注入一个Filebeat采集器对应用服务的业务日志进行采集。把采集到的日志入到kafka集群，然后logstash进行消息处理及格式化。

处理完后入到ES集群，最终我们就可以通过kibana查询到我们的业务日志了。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/7d/5a/2d/20190805-0a25629ce9a1dacf2ab2cde05af7dbb6.jpeg?imageView2/2/w/1280/interlace/0/q/70)

当然kafka、logstash、es得您自己去搭建。

若您可把这几个服务跑在Kubernetes可以参考我给您生成的yaml 直接apply 进去就能跑。

## 模版配置

生成filebeat会用到两个模版，一个是容器的模版**FilebeatContainer**，另一个是ConfigMap的模版**FilebeatConfigMap**，您可根据自己的需求调整相应的模版文件。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/35/64/b9/20190805-cb8769626b6297ebbe4629e764e35133.jpeg?imageView2/2/w/1280/interlace/0/q/70)