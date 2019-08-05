# 代码规范

### 目录结构

```
├── Dockerfile // Dockerfile文件
├── Makefile // 本地开发使用makefile
├── README.md // 介绍
├── app.cfg // 配置文件
├── cmd // 启动目录
│   ├── client // 客户端操作入口
│   └── server // server 端入口
├── config.yaml // kubeconfig 文件
├── docs // 文档
│   ├── README.md
├── go.mod // go mod依赖
├── go.sum // go mod依赖详情
├── install // 可能需要安装的一些yaml文件
├── src // 源码包 以下分为两个层级，src/下为组件, src/pkg/下 为模块
│   ├── amqp // rabbimt 的操作实现
│   ├── casbin // casbin 的实现
│   ├── cmd // cmd参数处理 
│   ├── config // 配置文件
│   ├── consul // 操作consul kv 的实现
│   ├── email
│   ├── event
│   ├── git-repo // 操作 gitlab及github 的实现
│   ├── istio
│   ├── jenkins // 操作jenkins 的实现
│   ├── jwt // jwt 
│   ├── kubernetes // 连接kubernetes这病
│   ├── logging
│   ├── middleware // 中间件
│   ├── mysql // 数据连接处理
│   ├── pkg // 具体的业务实现逻辑
│   │   ├── account
│   │   ├── audit
│   │   ├── auth
│   │   ├── build
│   │   ├── configmap
│   │   ├── consul
│   │   ├── cronjob
│   │   ├── dashboard
│   │   ├── deployment
│   │   ├── discovery
│   │   ├── event
│   │   ├── gateway
│   │   ├── git
│   │   ├── group
│   │   ├── hooks
│   │   ├── ingress
│   │   ├── market
│   │   ├── member
│   │   ├── monitor
│   │   ├── msgs
│   │   ├── namespace
│   │   ├── notice
│   │   ├── permission
│   │   ├── persistentvolume
│   │   ├── persistentvolumeclaim
│   │   ├── pod
│   │   ├── proclaim
│   │   ├── project
│   │   ├── public
│   │   ├── role
│   │   ├── service
│   │   ├── statistics
│   │   ├── storage
│   │   ├── template
│   │   ├── terminal
│   │   ├── tools
│   │   ├── virtualservice
│   │   ├── wechat
│   │   └── workspace
│   ├── redis // redis 单点或集群的实现
│   ├── repository // 操作数据库的具体实现
│   │   ├── types // 数据库表的struct
│   └── util // 所需要用到的工具
└── static // 静态目录 前端所编译好的代码
    ├── terminal.html
    └── xterm // 前端命令行终端
```

## 代码规范

### 格式化代码

Golang 代码使用 goimports 和 gofmt 进行代码格式化



### 合名规范

#### 文件名命名规范

用小写，尽量见名思义，看见文件名就可以知道这个文件下的大概内容，对于源代码里的文件，文件名要很好的代表了一个模块实现的功能。

#### 包名

保持 package 的名字和目录保持一致，尽量采取有意义的包名，简短，有意义，尽量和标准库不要冲突。命名尽量不使用分隔符。

#### 模块包规范

新增加的模块必须在src/pkg目录下，每个模块必须包含4个文件，分别是service.go、logging.go、endpoint.go、transport.go

#### 接口规范

定义一个接口：

```go
type Service interface {
  // 获取pod详情页数据
	Get(ctx context.Context, podName string) (res map[string]interface{}, err error)

  // 获取容器日志
	GetLog(ctx context.Context, podName, container string, previous bool) (res *LogDetails, err error)

  // 下载pod 容器日志
	DownloadLog(ctx context.Context, podName, container string, previous bool) (res io.ReadCloser, err error)

  // 删除pod
	Delete(ctx context.Context, podName string) (err error)
}
```

接口的实现：

```go
type service struct {
	logger    log.Logger
	k8sClient kubernetes.K8sClient
	config    *config.Config
}

func NewService(logger log.Logger, k8sClient kubernetes.K8sClient, 
config *config.Config) Service {
	return &service{logger, k8sClient, config}
}

func (c *service) Delete(ctx context.Context, podName string) (err error) {
	// ...
	return
}

```

#### 变量

- 局部变量：驼峰式，小写字母开头
- 全局变量：变量名采用驼峰标准

如：

```go
var (
	lineReadLimit int64 = 5000
	byteReadLimit int64 = 5000000
)
```



#### 常量

常量全部以驼峰式大写字母开头的方式命名：

```go
const (
	UserIdContext     ASDContext = "userId"
	EmailContext      ASDContext = "email"
	NamespaceContext  ASDContext = "namespace"
	NameContext       ASDContext = "name"
)
```

#### 错误处理命名

错误处理的原则就是不能丢弃任何有返回 err 的调用，不要采用_丢弃，必须全部处理。接收到错误，要么返回 err，并用 log记录下来。 error 的信息不要采用大写字母，尽量保持你的错误简短，但是要足够表达你的错误的意思。**每个pkg下的模块的错误必须定义在本模块下，不得跨模块调用。**

除了在man.go可以使用panic外，其于地方一率不得使用panic。

命名参考：

```go
var (
	ErrInvalidArgument               = errors.New("invalid argument")
	ErrStorageClassNotFound          = errors.New("没有找到相关存储类")
	ErrStorageClassIsExists          = errors.New("存储类已经存在")
	ErrStorageClassTemplateNotExists = errors.New("存储类模版不存在")
	ErrStorageClassTemplateEncode    = errors.New("存储类模版处理失败")
	ErrStorageClassK8sCreate         = errors.New("存储类创建失败")
	ErrStorageClassList              = errors.New("存储类列表获取失败")
	ErrStorageClassK8sGet            = errors.New("存储类获取失败")
)

```

