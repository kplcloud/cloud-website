# 构建应用

> 构建应用的流程是通过创建应用提交一些信息进行处理
>
> 1. 从git 仓库获取tags列表
> 2. 调用jenkins API 将应用的相关参数及版本信息传给它并进行构建
> 3. Jenkins Job执行Shell命令 执行docker build并上传致Docker 仓库
> 4. 平台监听到job已经执行完成并成功了，调用kubernetes API更新应用的Image地址
> 5. 监听升级情况
> 6. 发送通知

以上是构建应用的后端流程，而前端就变得比较简单了。只需要在应用详情页点击**"Build"**按钮，在弹出的对话框中选择相应用的tags版本并提交就行了，如下图：

![](http://source.qiniu.cnd.nsini.com/images/2019/08/6b/72/b8/20190808-1f90194b4d328bd7b2e965637226be9d.jpeg?imageView2/2/w/1280/interlace/0/q/70)

## 查询构建日志

点击详情页的**build日志**选项卡，会显示最近的构建记录，点击左侧相应的版本可以查看该版本的构建情况，也可以对正在松建的应用进行中断，如下图：

![](http://source.qiniu.cnd.nsini.com/images/2019/08/9a/41/01/20190808-453af40f44721bfa01946be041a9a6f8.jpeg?imageView2/2/w/1280/interlace/0/q/70)