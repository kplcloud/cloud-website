# 配置gitlab与jenkins

> 应用的源码是通过jenkins 从git 服务器上拉取到jenkins服务器上进行编译，所以我们需要让jenkins服务有对git服务的访问权限。
>
> 以下是介绍如何让jenkins有对gitlab和github的访问权限配置。

## gitlab配置

1. 登陆jenkins服务器
2. 进入 `cd ~/.ssh/`
3. 找到 `cat id_rsa.pub`
   * 如果没有请执行以下命令生成:
   * `$ ssh-keygen -o -t rsa -b 4096 -C`
4. 将内容贴到你的gitlab上

![](http://source.qiniu.cnd.nsini.com/images/2019/07/8c/43/e7/20190726-8ae0a304799c77e0e60684114388c392.jpeg?imageView2/2/w/1280/interlace/0/q/80)

## jenkins上的配置

1. 登陆jenkins服务器
2. 进入 `cd ~/.ssh/`
3. 找到 `cat id_rsa`
   * 如果没有请执行以下命令生成:
   * `$ ssh-keygen -o -t rsa -b 4096 -C`

进入 [http://{your](http://{your) jenkins server}/credentials/store/system/domain/\_/

![](http://source.qiniu.cnd.nsini.com/images/2019/07/7d/61/8b/20190726-d535f7c0a8f5be9b86b1056361c7d014.jpeg?imageView2/2/w/1280/interlace/0/q/100)

点击“添加凭据”

![](http://source.qiniu.cnd.nsini.com/images/2019/07/f8/bb/1e/20190726-0f2fda09eb0eec6514559cd2bb1f8b5f.jpeg)

将 privateKey 贴到 private Key块中，这样jenkins服务器就可以访问到gitlab服务了。

## 安装maven

java 应用构建需要安装maven 插件

![](http://source.qiniu.cnd.nsini.com/images/2019/07/20/a7/1d/20190726-8ea71c8c5b09d7701d69587da7820466.jpeg?imageView2/2/w/1280/interlace/0/q/100)

搜索 maven 插件，勾选好直接安装，安装好之后勾选自动重启jenkins

### 配置maven

进入全局工具 configureTools/

![](http://source.qiniu.cnd.nsini.com/images/2019/07/49/c5/e2/20190726-23cc2b4dcf892fffebae9d47c5649d74.jpeg?imageView2/2/w/1280/interlace/0/q/100)

选择新增maven 并配置好版本，如果您有自己的maven 根据自己的需求配置路径

