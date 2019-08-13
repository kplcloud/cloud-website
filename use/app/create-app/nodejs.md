# 创建一个NodeJS应用

> 在创建应用之前，首先我们要做的是在你的git项目上将Dockerfile文件提交上去，并且生成一个Tag或releases版本。

## Dockerfile 参考

```dockerfile
FROM node:latest

COPY ./ /opt/app
WORKDIR /opt/app

RUN yarn config set registry "https://registry.npm.taobao.org" && yarn install
CMD ["yarn", "start"]

```

## 进入创建应用页面，填写基本信息

1. 进入“创建项目”页面
2. 项目英文名填写项目的“英文名称” 名称的规则: `^[a-z0-9]([-a-z0-9])?([a-z0-9]([-a-z0-9]*[a-z0-9])?)*$`
3. 填写“项目描述” 可不填
4. 提交信息，进入第二步

![](http://source.qiniu.cnd.nsini.com/images/2019/08/6c/1d/1b/20190801-63ecd24bd0d2be4f16599f271d46c492.jpeg?imageView2/2/w/1280/interlace/0/q/80)

## 填写详细信息

1. 选择项目语言，目前支持主流的Golang、Java、NodeJS、Python、Nginx
2. 项目地址：输入项目的址 `kplcloud/hello` 填写完后会自动获取项目的tags列表
3. 选择版本：选择获取回来的tags版本
4. 构建路径：这是Dockerfile放到项目所在的路径地址
5. 容器数量：启动的Pods数量
6. 容器规格：该Pods的最大内存上限
7. 如果选择了“增加端口” 会列出端口、协议填写
8. 端口及协议：如果选择了则会创建Service进行负载，注意端口名称的格式，必须是`xxx-port`，可以添加多个端口，但建议一个应用只启动一个端口。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/43/19/fa/20190805-7e77d97823e1a3a3fe2d5d44194437f8.jpeg?imageView2/2/w/1280/interlace/0/q/80)

![](http://source.qiniu.cnd.nsini.com/images/2019/08/72/ee/ca/20190801-04373694ed64af40c9cdafa9ee372b75.jpeg?imageView2/2/w/1280/interlace/0/q/80)

提交成功之后会显示如下页面，管理就可以在审核页面进行部署。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/63/d9/1e/20190801-559cc5e18caee1381f6a7d4cd90637be.jpeg?imageView2/2/w/1280/interlace/0/q/80)

