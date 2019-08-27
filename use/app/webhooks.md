# webHooks

> `webhook` 用来监测你在 `kplcloud` 上的各种事件
> 如果设置了一个监测事件的 `webhook` 当你这个项目涉及到相关操作时
> 会发送一个 HTTP `POST` 请求到你配置好的地址


## webhooks（项目详情->Webhooks）

点击菜单栏，列表信息展示已创建的Webhooks状态及绑定事件等。



![](http://source.qiniu.cnd.nsini.com/images/2019/08/6d/0a/92/20190823-221e25276f2420eb9137f94c0a66d307.jpeg)

根据自己的需要创建，如果是希望关注全局，请选择钩子类型为 `global` ，请将激活状态为 `激活` 否则事件不会被监听.

![](http://source.qiniu.cnd.nsini.com/images/2019/08/24/40/23/20190823-4a87233c0e323b1d28e900df40824390.jpeg)



创建好的hooks，可以在列表页点击 **测试** 进行发送一条hook数据。