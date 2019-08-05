---
description: 安装持久化存储
---

# 持久化存储

## 持久化存储的相关配置

> 这里使用的是NFS的方式进行持久化，如果您有自己的持久化方案可以不使用改方案。

```text
$ kubectl apply -f install/kubernetes/storage/serviceaccount.yaml
$ kubectl apply -f install/kubernetes/storage/rbac.yaml
$ kubectl apply -f install/kubernetes/storage/provisioner.yaml
$ kubectl apply -f install/kubernetes/storage/stroageclass.yaml
```

### 需要调整provisioner

根据您自己的环境调service地址及path。

```text
volumes:
- name: kpl-nfs-client-root
  nfs:
    server: 172.16.0.4
    path: "/home/data"
containers:
- name: kpl-nfs-client-provisioner
  image: quay.io/external_storage/nfs-client-provisioner:latest
  env:
    - name: PROVISIONER_NAME
      value: fuseim.pri/ifs
    - name: NFS_SERVER
      value: 172.16.0.4
    - name: NFS_PATH
      value: "/home/data"
```

![](http://source.qiniu.cnd.nsini.com/images/2019/07/ee/9f/ea/20190723-551e420d647eae0de5864f249f6eee83.jpeg?imageView2/2/w/1280/interlace/0/q/100)

![](http://source.qiniu.cnd.nsini.com/images/2019/07/f8/11/ec/20190723-1f0a6e38a6dac148ee883db9110f82f9.jpeg?imageView2/2/w/1280/interlace/0/q/100)

