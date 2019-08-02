# mysql 

> 为了方便给大家演示，mysql也使用的docker版本部署在kubernetes集群上，真实环境请使用独立的mysql服务器

如果您还没有初始化持久化存储的，请在这里[持久化存储](storage.md)配置好存储类再安装mysql服务。


## 安装

```
$ kubectl apply -f install/kubernetes/mysql/statefulset.yaml
$ kubectl apply -f install/kubernetes/mysql/service.yaml
```

- `MYSQL_ROOT_PASSWORD`: mysql用户名
- `MYSQL_ROOT_PASSWORD`: mysql密码

[statefulset.yaml](../../install/kubernetes/mysql/statefulset.yaml)

本项目需要创建数据库: kplcloud