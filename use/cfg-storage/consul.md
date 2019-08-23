# 配置中心Consul使用说明

**Consul相关功能:**

- 根据项目及业务线配置一个`ConsulACL`（即：Consul权限）。
- 根据配置好的 **Consul token**，可配置具体 `Key/Value`。

**Consul相关提示:**

- 支持删除 `ACL` 删除后不可恢复。
- 支持删除 `Key/Value` 具体 字段 及 文件夹，删除后不可恢复。
- `Key/Value` 的增、删、改，都需要用到 **token**，请妥善保管。

## 操作步骤

### ACL 管理

1. `Consul` 位置：菜单栏 >> 配置与存储 >> Consul/KV配置中心

   ![](http://source.qiniu.cnd.nsini.com/images/2019/08/ed/27/a3/20190823-beace63274083822ad2e8163270ed4dc.jpeg?imageView2/2/w/1280/interlace/0/q/70)

2. 创建 `ACL` , 填写 `项目名称` 及选择 `命名空间`, Rules 填写支持 `命名空间.项目名称`（eg: `local.kplcloud`） 

   ![](http://source.qiniu.cnd.nsini.com/images/2019/08/44/36/1b/20190823-be9a72ece643bcbf1541a5a036944454.jpeg?imageView2/2/w/1280/interlace/0/q/70)

3. 点击列表中的名称，可查询 `ACL` 详情

   ![](http://source.qiniu.cnd.nsini.com/images/2019/08/e1/79/4a/20190823-47ddd3d7f09da257428b0fc0793e1f28.jpeg?imageView2/2/w/1280/interlace/0/q/70)

### Key/Value 管理

1. 点击列表中的 `token` 可进入管理页面。

   ![](http://source.qiniu.cnd.nsini.com/images/2019/08/c1/be/bf/20190823-6ac50c2e2311f8e2ba6ec2e4be1c11b2.jpeg?imageView2/2/w/1280/interlace/0/q/70)

2. 详情页中您可以很方便的管理项目的 `Key/Value` 了。左侧展示 `K/V` 列表，右侧可对具体的 `K/V` 进行修改

![](http://source.qiniu.cnd.nsini.com/images/2019/08/e2/bd/63/20190823-10ba26b1f38b31a56ec8f3edbd8e2fca.jpeg?imageView2/2/w/1280/interlace/0/q/70)

![](http://source.qiniu.cnd.nsini.com/images/2019/08/00/2b/73/20190823-f474dcf1745f38077d3429cb2bc00312.jpeg?imageView2/2/w/1280/interlace/0/q/70)

## 结束语

```
更多功能，待您实际使用发现。。。
```