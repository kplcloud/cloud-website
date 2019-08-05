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

2. 创建 `ACL` , 填写 `项目名称` 及选择 `命名空间`, Rules 填写支持 `命名空间.项目名称`（eg: `local.kplcloud`） 
3. 点击列表中的名称，可查询 `ACL` 详情

### Key/Value 管理

1. 点击列表中的 `token` 可进入管理页面。
2. 详情页中您可以很方便的管理项目的 `Key/Value` 了。左侧展示 `K/V` 列表，右侧可对具体的 `K/V` 进行修改



## 结束语

```
更多功能，待您实际使用发现。。。
```