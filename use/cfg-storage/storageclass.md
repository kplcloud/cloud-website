# 存储类管理

> Kubernetes集群管理员通过提供不同的存储类，可以满足用户不同的服务质量级别、备份策略和任意策略要求的存储需求。动态存储卷供应使用StorageClass进行实现，其允许存储卷按需被创建。
>
> 如果没有动态存储供应，Kubernetes集群的管理员将不得不通过手工的方式类创建新的存储卷。
>
> 通过动态存储卷，Kubernetes将能够按照用户的需要，自动创建其需要的存储。



![](http://source.qiniu.cnd.nsini.com/images/2019/08/e5/28/7c/20190823-c0bdf20f6403cb3170a0289728fe594b.jpeg?imageView2/2/w/1280/interlace/0/q/70)

## 供应者

创建存储类之前必须得有 "provisioner"，每个平台所使用的存储方案可能都会不一样。您可根据自己方式安装相应的Provisioner。

官方文档：[https://kubernetes.io/docs/concepts/storage/storage-classes/](https://kubernetes.io/docs/concepts/storage/storage-classes/)

| Volume Plugin        | Internal Provisioner | Config Example                                               |
| -------------------- | -------------------- | ------------------------------------------------------------ |
| AWSElasticBlockStore | ✓                    | [AWS EBS](https://kubernetes.io/docs/concepts/storage/storage-classes/#aws-ebs) |
| AzureFile            | ✓                    | [Azure File](https://kubernetes.io/docs/concepts/storage/storage-classes/#azure-file) |
| AzureDisk            | ✓                    | [Azure Disk](https://kubernetes.io/docs/concepts/storage/storage-classes/#azure-disk) |
| CephFS               | -                    | -                                                            |
| Cinder               | ✓                    | [OpenStack Cinder](https://kubernetes.io/docs/concepts/storage/storage-classes/#openstack-cinder) |
| FC                   | -                    | -                                                            |
| Flexvolume           | -                    | -                                                            |
| Flocker              | ✓                    | -                                                            |
| GCEPersistentDisk    | ✓                    | [GCE PD](https://kubernetes.io/docs/concepts/storage/storage-classes/#gce-pd) |
| Glusterfs            | ✓                    | [Glusterfs](https://kubernetes.io/docs/concepts/storage/storage-classes/#glusterfs) |
| iSCSI                | -                    | -                                                            |
| Quobyte              | ✓                    | [Quobyte](https://kubernetes.io/docs/concepts/storage/storage-classes/#quobyte) |
| NFS                  | -                    | -                                                            |
| RBD                  | ✓                    | [Ceph RBD](https://kubernetes.io/docs/concepts/storage/storage-classes/#ceph-rbd) |
| VsphereVolume        | ✓                    | [vSphere](https://kubernetes.io/docs/concepts/storage/storage-classes/#vsphere) |
| PortworxVolume       | ✓                    | [Portworx Volume](https://kubernetes.io/docs/concepts/storage/storage-classes/#portworx-volume) |
| ScaleIO              | ✓                    | [ScaleIO](https://kubernetes.io/docs/concepts/storage/storage-classes/#scaleio) |
| StorageOS            | ✓                    | [StorageOS](https://kubernetes.io/docs/concepts/storage/storage-classes/#storageos) |
| Local                | -                    | [Local](https://kubernetes.io/docs/concepts/storage/storage-classes/#local) |

官方提供了以上方案，而这里我们方便演示使用最简单的NFS方案。

### 安装NFS

#### 安装服务端

```
$ sudo yum install nfs-utils
```

#### 开机启动

```
$ sudo systemctl enable rpcbind
$ sudo systemctl enable nfs
```

#### 启动NFS

```
$ sudo systemctl start rpcbind
$ sudo systemctl start nfs
```

### 配置共享目录

```
$ sudo mkdir /opt/data
$ sudo chmod 755 /opt/data
```

打开文件：

```
$ sudo vi /etc/exports
```

添加以下配置：

```
/opt/data/ *(rw,nohide,insecure,no_subtree_check,async,no_root_squash)
```

重启：

```
$ sudo systemctl restart nfs
```

### 安装Provisioner

修改`install/kubernetes/storage/provisioner.yaml`的IP地址及路径后执行以下命令：

```bash
$ kubectl apply -f install/kubernetes/storage/provisioner.yaml
$ kubectl apply -f install/kubernetes/storage/rbac.yaml
$ kubectl apply -f install/kubernetes/storage/serviceaccount.yaml
```

## 创建存储类

在**“配置与存储”**->**“存储类”**菜单点开。

在列表页面点击**“新建”**按钮，在弹出来的对话框中输入以下信息：

![](http://source.qiniu.cnd.nsini.com/images/2019/08/c4/2e/f8/20190823-98ab4f92d00283a6f4eabe6c2e3c4abe.jpeg?imageView2/2/w/1280/interlace/0/q/70)

- 名称: 规则 `^[a-z0-9]([-a-z0-9])?([a-z0-9]([-a-z0-9]*[a-z0-9])?)*$`可以有"."

- Provisioner：供应者服务名

  >  这里我创建了一个名为“kpl-nfs-client-provisioner”的供应者。如果您可使用NFS的方式存储方案可以参考以上方案

- ReclaimPolicy：回收策略 [更改 PersistentVolume 的回收策略](https://kubernetes.io/zh/docs/tasks/administer-cluster/change-pv-reclaim-policy/)
  - Recycle
  - Delete
  - Retain

- VolumeBindingMode: [Volume Binding Mode](https://kubernetes.io/docs/concepts/storage/storage-classes/#volume-binding-mode)
  - Immediate
  - WaitForFirstConsumer

## 存储类详情

创始完成存储类之后点击创建的存储类可查看详情，若有PVC及pv关联会在在这里显示：

![image-20190823162311096](http://source.qiniu.cnd.nsini.com/images/2019/08/b0/d7/e8/20190823-641e7ea6f352855ae8c4475fd70b0c54.jpeg?imageView2/2/w/1280/interlace/0/q/70)

![](http://source.qiniu.cnd.nsini.com/images/2019/08/ca/16/a3/20190823-45278a523de03358a2d75db016dca25b.jpeg?imageView2/2/w/1280/interlace/0/q/70)