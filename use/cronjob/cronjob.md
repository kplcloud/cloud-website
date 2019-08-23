# 定时任务相关操作

### 添加

#### 添加定时任务

- 菜单-->应用管理-->定时任务--> 创建定时任务按钮

- 填入定时任务相关

  > 注意: 脚本模式和命令模式  是不一样的!

- 点击提交后,开始构建定时任务

  ~~~flow
  ```flow
  st=>start: 前端提交创建定时任务
  isExists=>condition: 任务是否已经存在?
  cronCreate=>operation: 数据库创建定时任务
  jenkinsCreate=>operation: jenkins创建Job
  jenkinsBuild=>operation: jenkins构建
  buildLogCreate=>operation: 构建信息插入数据库
  amqQueueBuild=>operation: 构建信息推入队列
  k8sCreate=>operation: k8s创建定时任务
  amqQueueListen=>operation: 队列监听构建结果
  buildLogUpdate=>operation: 构建信息修改
  s=>end: 成功
  e=>end: 失败
  
  st->isExists->cronCreate->jenkinsCreate->jenkinsBuild->buildLogCreate->amqQueueBuild->k8sCreate->amqQueueListen->buildLogUpdate->s
  isExists(yes)->cronCreate
  isExists(no)->e
  ```
  ~~~

  

#### 添加日志采集

- 在成功构建定时任务后,可在定时任务列表点击任务,进入任务详情里,日志采集添加日志路径

#### 添加环境变量

- 任务详情里,环境变量板块自定义环境变量

#### 添加配置

- 任务详情里,配置板块添加配置



### 修改

- 定时任务列表,点击需要修改的定时任务, 修改相关信息后,点击`提交`,定时任务会进行修改

### 删除

- 定时任务列表,点击需要删除的定时任务,点击`删除`,会删除定时任务相关信息,包括`数据库`和`k8s`等相关信息都会被删除