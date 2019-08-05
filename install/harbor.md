# 安装Harbor

> 镜像仓库就别在跑kubernetes集群上了，似乎也跑不了，找一台容量大的有安装Docker的服务器进行搭建。



安装启动方式，请查看官方说明：<https://github.com/goharbor/harbor/blob/master/docs/installation_guide.md>

## 安装

1. 下载Harbor安装文件，我这下的是离线处理，如果下载不了请加代理

   ```bash
   $ https://storage.googleapis.com/harbor-releases/release-1.8.0/harbor-offline-installer-v1.8.1.tgz
   ```

2. 解压

   ```bash
   $ tar -zxvf harbor-offline-installer-v1.8.1.tgz
   ```

3. 配置harbor文件 harbor.conf

   ```ini
   ## Configuration file of Harbor
   
   # hostname设置访问地址，可以使用ip、域名，不可以设置为127.0.0.1或localhost
   hostname = hub.kpaas.nsini.com
   
   # 访问协议，默认是http，也可以设置https，如果设置https，则nginx ssl需要设置on
   ui_url_protocol = http
   
   # mysql数据库root用户默认密码root123，实际使用时修改下
   db_password = root123
   
   max_job_workers = 3 
   customize_crt = on
   ssl_cert = /data/cert/server.crt
   ssl_cert_key = /data/cert/server.key
   secretkey_path = /data
   admiral_url = NA
   
   # 邮件设置，发送重置密码邮件时使用
   email_identity = 
   email_server = smtp.mydomain.com
   email_server_port = 25
   email_username = sample_admin@mydomain.com
   email_password = abc
   email_from = admin <sample_admin@mydomain.com>
   email_ssl = false
   
   # 启动Harbor后，管理员UI登录的密码，默认是Harbor12345
   harbor_admin_password = Harbor12345
   
   # 认证方式，这里支持多种认证方式，如LADP、本次存储、数据库认证。默认是db_auth，mysql数据库认证
   auth_mode = db_auth
   
   # LDAP认证时配置项
   #ldap_url = ldaps://ldap.mydomain.com
   #ldap_searchdn = uid=searchuser,ou=people,dc=mydomain,dc=com
   #ldap_search_pwd = password
   #ldap_basedn = ou=people,dc=mydomain,dc=com
   #ldap_filter = (objectClass=person)
   #ldap_uid = uid 
   #ldap_scope = 3 
   #ldap_timeout = 5
   
   # 是否开启自注册
   self_registration = on
   
   # Token有效时间，默认30分钟
   token_expiration = 30
   
   # 用户创建项目权限控制，默认是everyone（所有人），也可以设置为adminonly（只能管理员）
   project_creation_restriction = everyone
   
   verify_remote_cert = on
   ```

4. 启动Harbor，直接执行./install.sh 或 docker-composer都可以

   ```bash
   $ ./install.sh
   $ docker-compose start
   ```


