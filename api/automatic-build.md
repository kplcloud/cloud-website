# 自动构建(由于目前暂只支持tags本功能不好使)

> 开发、测试可能会有频繁更新应用版本的时候，每次需要在kplcloud平台上进行build，为了方便我们快速发布，我们在给gitlab提供了一个api。当git push 时会触发该事件进行自动化build。

## Gitlab配置Webhooks

首先打开gitlab仓库，并进入项目详情，在右上角有一个设置，点击它，在弹出的下拉框选择"Webhooks"进入webhooks事件页面，如下图所示。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/79/ba/a1/20190814-93b28e1f8ad01d6ea8f69f6aba679e5d.jpeg?imageView2/2/w/1280/interlace/0/q/100)

![](http://source.qiniu.cnd.nsini.com/images/2019/08/83/6b/ff/20190814-3e09afc15e8bf349fb08cf056b083d57.jpeg?imageView2/2/w/1280/interlace/0/q/100)

在配置webhooks项需要填两项内容，第一个URL:

##### 规则是: https://kplcloud.nsini.com/public/build/{空间代号}/app/{应用名称}?word={关键字}&branch={分支}

其中 word关键字 和 branch分支都是可选填

- word为空的话 默认监听的是 "build" 关键字，当提交的 message 中包含 "build" 字样就会进行 构建。
- branch为空的话 默认取的是在 kplcloud 上创建项目时所选择的那个分支进行 构建。

第二个参数是 Secret Token

这个token 从哪里来呢？

打开kplcloud平台，找到该项目并进行详情页，在详情页找到"详情"卡片，如下图所示：

复制改token填到 gitlab上的webhook  Secret Token下就可以了。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/95/dd/08/20190814-342b2e378def8dfd01b8049add99542f.jpeg?imageView2/2/w/1280/interlace/0/q/100)

第个是勾选需要的事件，主要把 push event勾上就行了，其他的可选。需要注意的是要把 SSL verification 给去掉，把这个勾给去掉。

## 验证测试

添加完之后，我们可以点击“Test”按钮

![](http://source.qiniu.cnd.nsini.com/images/2019/08/ac/c9/9c/20190814-6726465829d4c3d9945e4539c99ac1de.jpeg?imageView2/2/w/1280/interlace/0/q/100)

返回200就表示验证成功了。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/d3/c2/df/20190814-6a8c0720c075fa80d2a7fe24c27d3ef0.jpeg?imageView2/2/w/1280/interlace/0/q/100)

