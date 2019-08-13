# 登陆

> 登陆可以分为三种，分别是LDAP登陆、邮箱密码登陆、三方授权登陆，咱们没有注册功能。下面对这三种登陆方式进行讲解。

LDAP与邮箱登陆大同小异，只需要简单的配置即可。

## LDAP登陆

在app.cfg文件找到`[server]`的`login_type`参数，设置为 **`ldap`**并且找到`[ldap]`块

```ini
[ldap]
ldap_host = 127.0.0.1
ldap_port = 389
ldap_base = DC=yourdomain,DC=corp
ldap_sseSSL = false
ldap_bindDN = 
ldap_bind_password = 
ldap_user_filter = (userPrincipalName=%s)
ldap_group_filter = (&(objectCategory=Group))
ldap_attr = name;mail

[server]
;auth_login 
login_type = ldap
```

输入你家LDAP的相关信息即可。

*不要设置`auth_login`,应该把它注释掉*

## 邮箱登陆

在app.cfg文件找到`[server]`的`login_type`参数，设置为 **`email`**

```ini
[server]
;auth_login 
login_type = ldap
```

*不要设置`auth_login`,应该把它注释掉*

![](http://source.qiniu.cnd.nsini.com/images/2019/08/93/62/e4/20190808-9d1ad5b7bdb341dee5b94f2562a93f2d.jpeg?imageView2/2/w/1280/interlace/0/q/70)

## Github授权登陆

>  通过Github授权登陆需要的app.cfg将[server]下的 auth_login参数设置为github



### Github创建OAuth App

1. 打开github官网，进入[https://github.com/settings/developers](https://github.com/settings/developers)， 在左侧菜单栏找到“OAuth Apps”并点击进入

2. 如果没有OAuth App则点击“New OAuth App”按钮创建一个新的OAuth App

3. 创建完成之后 找到我们刚刚创建的OAuth App并进入就可以看到Client ID和Client Secret了

4. 将它们复制下来他贴到app.cfg的`[server]`块下的`client_id`和`client_secret`

   ![](http://source.qiniu.cnd.nsini.com/images/2019/08/85/43/e0/20190808-44881f18b9f20d16efcfc5d4438856d9.jpeg?imageView2/2/w/1280/interlace/0/q/70)

5. 设置好Homepage URL和Authorization callback URL

   ![](http://source.qiniu.cnd.nsini.com/images/2019/08/0c/a6/44/20190808-3cd06219f2e84b4b4fb2e3a0a6a0c888.jpeg?imageView2/2/w/1280/interlace/0/q/70)

6. 授权登陆需要用户把 [https://github.com/settings/profile](https://github.com/settings/profile) Public Email 设置上，否则无法授权成功

   ![](http://source.qiniu.cnd.nsini.com/images/2019/08/73/6d/d7/20190808-0b4fb2cde5627616d3d3b2016d373e33.jpeg?imageView2/2/w/1280/interlace/0/q/70)

### 授权登陆

上面设置好之后， 就可以使用github授权登陆的方式进入平台了，默认分配的空间及权限可以在app.cfg文件下的`[server]`块下的`default_namespace`和`default_role_id`配置

```ini
[server]
client_id = balabalabalbabiubiubiu
client_secret = balabalabalbabiubiubiu
auth_login = github
default_namespace = default-app
default_role_id = 4
```

![](http://source.qiniu.cnd.nsini.com/images/2019/08/d7/85/0c/20190808-c3ccecfa1ea7cd260f168074858d77c3.jpeg?imageView2/2/w/1280/interlace/0/q/70)

![](http://source.qiniu.cnd.nsini.com/images/2019/08/71/e5/12/20190812-0b6d4599d557209716653941e5a71a25.jpeg?imageView2/2/w/1280/interlace/0/q/70)

