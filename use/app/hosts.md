# 自定义hosts

在我们测试应用的时候或没有域名解析时，我们可能需要自己定义hosts的指向，在kplcloud我们提供的该功能

打开应用详情面在“详情”卡片上找到"hosts"如下图

![](http://source.qiniu.cnd.nsini.com/images/2019/08/ed/e3/b8/20190805-a00e51be68868707b546e862e31ed1dd.jpeg?imageView2/2/w/1280/interlace/0/q/70)

点击编辑按钮后会弹出对话框

![](http://source.qiniu.cnd.nsini.com/images/2019/08/ba/65/b5/20190805-9188863bb4b55227b105afe6659bac19.jpeg?imageView2/2/w/1280/interlace/0/q/70)

在Hosts框中就可以添加我们需要自定义的hosts地址了。

框加写法与 /etc/hosts 的写法一样，可以添加多条。

添加成功后会自动重启容器，重启完成后就生效果了。