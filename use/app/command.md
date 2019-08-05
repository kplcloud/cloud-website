# 自定义启动命令

应用服务启动可以在多个地方进行调整，以下介绍两种方案，Dockerfile 和 平台详情页调整

## Dockerfile CMD启动方式

看一下简单的例子：

```dockerfile
FROM hub.kpaas.nsini.com/app/hello:v0.0.3

CMD ["/go/bin/hello"]
```

启动命令写在CMD这个后面，如果后面有多个参数可以以逗号隔开例如: CMD ["static-web", "-path", "app", "-port", ":8080"]



## 平台详情页调整

打开应用详情页：

![](http://source.qiniu.cnd.nsini.com/images/2019/08/a5/78/bc/20190805-f36284cdf591c626bc7dfc9c784a5bf3.jpeg?imageView2/2/w/1280/interlace/0/q/70)

在详情这一选卡上找到“命令，参数”，点右边的编辑icon，弹出对话框进行填写：

![](http://source.qiniu.cnd.nsini.com/images/2019/08/de/ab/76/20190805-640aca8beff664e2701aba70abdded1b.jpeg?imageView2/2/w/1280/interlace/0/q/70)

填定启动的命令和参数，参数用逗号隔开。点提交服务会自动重启动。

**注意：在平台详情页修改的命令会覆盖掉Dockerfile 下的CMD命令。**

