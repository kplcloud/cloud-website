# 挂载持久化存储卷

> 本平台是通过storageclass来动态创建PV。也就是说咱们依赖于storageclass，如果您的Kubernetes不支持相应的存储试，将无法非常方便的进行挂载。
>
> 目前暂不支持挂载多个PVC，或许以后会更新吧。
>
> 这里演示的是用的NFS进行演示，实际使用时可根据自己的需求配置相应的provisioner，其他配置是一样的不需要调整，只需要在“模版管理” 调整StorageClass和PersistentVolumeClaim模版。

## 创建持久化存储卷声明

在菜单找到**“配置与存储”->"持久化存储卷声明"**。

选择应用的空间，并点击**“创建”**按钮

![](http://source.qiniu.cnd.nsini.com/images/2019/08/ce/b7/b7/20190813-2a585696c0d07c17b010e589b75ce7ce.jpeg?imageView2/2/w/1280/interlace/0/q/70)

在弹出的对话框中会有几个选项目：

- 名称：存储卷的名称（规则: `^[a-z0-9]([-a-z0-9])?([a-z0-9]([-a-z0-9]*[a-z0-9])?)*$`）
- 容量：可以使用的存储区大小，最小单位Mi，最大Ti
- 访问模式：
  - ReadWriteOnce——该卷可以被单个节点以读/写模式挂载
  - ReadOnlyMany——该卷可以被多个节点以只读模式挂载
  - ReadWriteMany——该卷可以被多个节点以读/写模式挂载
- 存储类：如果没有存储类请查看[创建存储类](../cf-storage/storageclass.md)

![](http://source.qiniu.cnd.nsini.com/images/2019/08/e6/9d/75/20190813-09ab64e09ab15f4c7f336b889dbe6c34.jpeg?imageView2/2/w/1280/interlace/0/q/70)

## 挂载到应用目录

当存储卷创建好之后就可以在应用进行挂载了。

同样的进入应用详情页面，找到**“持久化存储”**选项卡，如图：

![](http://source.qiniu.cnd.nsini.com/images/2019/08/ea/57/73/20190813-fdc975ee3d593dcb754a4c54578eacc9.jpeg?imageView2/2/w/1280/interlace/0/q/70)

点击**“添加”**按钮，在弹出来的对话框加输入相关信息：

![](http://source.qiniu.cnd.nsini.com/images/2019/08/e2/c0/cf/20190813-84479c9de314fe80c336d2b3c0ce2b1e.jpeg?imageView2/2/w/1280/interlace/0/q/70)

- 持久化存储路径：该路径为容器里的挂载路径
- 持久化存储卷声明：这里会列出您可以使用的存储卷

填写好路径及选择好存储卷后点击提交，改应用的所有POD的逐步重启动。

挂载完成之后可以看到所挂载的相关信息：

![](http://source.qiniu.cnd.nsini.com/images/2019/08/5a/0e/c3/20190813-6eb168f7e6e93951c56fa1b10e65aceb.jpeg?imageView2/2/w/1280/interlace/0/q/70)

最终生成的yaml结果：

```yaml
volumes:
- name: soup-hello-pvc
  persistentVolumeClaim:
    claimName: test-data
containers:
- volumeMounts: 
  - name: "soup-hello-pvc"
    mountPath: "/soupzhang"

```

