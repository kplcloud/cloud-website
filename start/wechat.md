# 配置微信公众号

配置微信公众号有什么用？

便于通过微信接收平台的消息，并且可以在用户中心自定义接收事件类型，方便即时接收消息

配置说明

1.登录https://mp.weixin.qq.com/，开发->基本配置

![](http://source.qiniu.cnd.nsini.com/images/2019/08/2e/15/f4/20190820-4ccd06676db0427efae804751572e486.jpeg?imageView2/2/w/1280/interlace/0/q/70)

2.配置文件 [app.cfg]

```
; ;[wechat]
; ;app_id: 微信公众号的应用ID
; ;access_token: 微信公众号的应用access_token
[wechat]
app_id = wx12345678985  											#开发者ID(AppID)
app_secret = fcfkftclie0e9a71fdf4af4c05b84b  	#开发者密码(AppSecret)
token = TEST																	#令牌(Token)
encoding_aes_key = ASDFAWERF335ADFVDF23RDFD   #消息加解密密钥(EncodingAESKey)
```

3.配置项说明

3.1 IP白名单是开普勒平台布署的服务器IP

3.2 服务器地址(URL)是开普勒平台微信服务链接 https://kplcloud.nsini.com/wechat/server

域名替换为实际配置的域名即可

3.3 消息密钥是安全模式下，用于加解密跟微信交互的消息使用的。也可以选明文模式

3.4 在微信公众平台填好对应信息后，点击启用配置（点击启用配置前，先确认平台已布署可正常访问）

