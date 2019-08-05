# 应用审核部署

如果配置了邮箱，用户提交审核之后会给管理员发送邮件，邮件里带有审核地址。

或者您也可以在应用列表里找到未审核的应用进入。

![](http://source.qiniu.cnd.nsini.com/images/2019/08/84/6b/07/20190805-d669ab85aadf7f650870f40e6b58457a.jpeg?imageView2/2/w/1280/interlace/0/q/70)



## 审核应用

### 提交的基础信息

![](http://source.qiniu.cnd.nsini.com/images/2019/08/df/3d/ac/20190805-a39ede61339bc97aad7f94a73dedfb55.jpeg)



### 生成的kubernetes yaml

![](http://source.qiniu.cnd.nsini.com/images/2019/08/28/59/bb/20190805-171de63c4510be0eb1951d9b5982892b.jpeg)

### 代码库中的Dockerfile文件

![](http://source.qiniu.cnd.nsini.com/images/2019/08/5d/c5/4e/20190805-f5fb16b5dcf1edca41881bb4c5d5d678.jpeg)

### 驳回

![](http://source.qiniu.cnd.nsini.com/images/2019/08/17/f3/9b/20190805-3d408fd71cb3bfa194ceb362f3c177c7.jpeg?imageView2/2/w/1280/interlace/0/q/70)

如果管理员觉得提交的有问题，可以进行驳回，驳回填定理由会发送至提交者的邮箱。

若没有啥问题，可以点击“开始部署”按钮。