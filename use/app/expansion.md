# 扩容

> 扩容是对Pods的使用资源进行扩容，例如最大使用的CPU及内存资源。



在应用的详情页面，在右上角找到**“扩容”**按钮，并点开。

在弹出的对话框中拖动CPU和内存，可对其设置一个基础值及一个最大值，如下图：

![](http://source.qiniu.cnd.nsini.com/images/2019/08/35/b8/ac/20190813-e77cb1f8c581c982aec0fa4bb8a35f81.jpeg?imageView2/2/w/1280/interlace/0/q/70)

选择好相应的值后点击**“保存”**按钮后，会重起该应用的所有POD。重启后的POD可使用的最大CPU及内存资源就是您刚刚设置的值。

所对应用以deployment的yaml参数：

```yaml
requests:
	limits:
		cpu: 1
		memory: 128Mi
	requests:
		cpu: 500m
		memory: 64Mi
```

