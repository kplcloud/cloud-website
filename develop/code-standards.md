# paas-api 代码规范

## 目录结构

```
.
├── Dockerfile // 构建使用的Dockerfile文件
├── LICENSE
├── Makefile // 本地开发、调试方便使用
├── README.md // README
├── app.dev.cfg // 开发配置文件
├── app.prod.cfg // 生产配置文件
├── app.test.cfg // 测试配置文件
├── cmd // 入口
│   ├── client // 客户端测试
│   │   └── client.go
│   ├── main.go // 入口main
│   └── service
│       ├── service.go // 启动前的基础配置，各个模块的实例化、数据库等外部资源的连接初始化都在这
│       ├── service_gen.go // 数据库命令行操作
│       ├── service_setting.go // 系统设置命令行操作
│       ├── service_sore.go // 初始化验证码仓库
│       ├── service_start.go // 启动服务, http、grpc初始化都会在这
│       └── service_tracer.go // 初始化tracer
├── docker-compose.yaml
├── docs // 文档目录
├── go.mod // go依赖
├── go.sum
├── src // 源
│   ├── api // 所有连接外部的api统一出入口
│   │   ├── alarm // 统一告警中心api
│   │   │   ├── logging.go // 日志
│   │   │   ├── service.go // 实现逻辑
│   │   │   ├── service_test.go // 单元测试
│   │   │   └── tracing.go // 链路
│   │   ├── api.go // 初始化各个外部api服务
│   ├── encode // 处理response的逻辑包
│   │   ├── response.go // response处理逻辑
│   │   └── responsestatus.go // 错误码定义
│   ├── helpers // helpers 
│   │   └── hashids // 生成唯一码
│   │       └── hashids.go
│   ├── jwt // jwt
│   │   └── jwt.go
│   ├── kubernetes // 连接k8s客户端实现逻辑
│   │   ├── client.go
│   │   ├── logging.go
│   │   └── tracing.go
│   ├── logging // 全局日志配置
│   │   └── logging.go // 输出的方式，及未被定义的错误会在这进行处理
│   ├── middleware // 全局、上层中间件
│   │   ├── access.go // 授权验证中间件
│   │   ├── asd.go // 登陆验证中间件
│   │   ├── audit.go // 审计中间件
│   │   ├── cluster.go // 集群验证中间件
│   │   ├── limitter.go // 限流中间件
│   │   ├── namespace.go // 项目空间处理中间件
│   │   └── tracing.go // 链路追踪中间件
│   ├── pkg // 业务模块包
│   │   ├── access // 授权管理模块
│   │   │   ├── endpoint.go // 端点连接request,middleware,service,response
│   │   │   ├── http.go // 处理http请求
│   │   │   ├── logging.go // 处理grpc请求
│   │   │   ├── service.go // 具体业务逻辑代码
│   │   │   └── tracing.go // 链路追踪
│   │   ├── auth // 登陆授权模块
│   │   │   ├── endpoint.go // 端点连接request,middleware,service,response
│   │   │   ├── http.go // 处理http请求
│   │   │   ├── instrumenting.go // 模块指标监控 给prometheus的监控指标
│   │   │   ├── logging.go //  日志
│   │   │   ├── middleware.go // 本模块独立中间件
│   │   │   ├── service.go // 具体业务逻辑代码
│   │   │   └── tracing.go // 链路追踪
│   │   ├── openapi // 开放API模块，对外开放的接口模块，只对开放API使用，其他模块不允许调用业务功能多的时候可能会独立出出去
│   │   │   ├── nginx // nginx操作业务模块
│   │   │   │   ├── endpoint.go // 端点连接request,middleware,service,response
│   │   │   │   ├── http.go // 处理http请求
│   │   │   │   ├── grpc.go // 处理grpc请求
│   │   │   │   ├── pb // grpc 的pb文件
│   │   │   │   ├── logging.go // 日志
│   │   │   │   ├── middleware.go // 本模块独立中间件
│   │   │   │   ├── service.go // 具体业务逻辑代码
│   │   │   │   └── tracing.go // 链路追踪
│   │   │   └── user // 用户相关操作业务模块
│   │   │       ├── endpoint.go // 端点连接request,middleware,service,response
│   │   │       ├── http.go // 处理http请求
│   │   │       ├── logging.go // 日志
│   │   │       ├── service.go // 具体业务逻辑代码
│   │   │       ├── service_test.go // 单元测试
│   │   │       └── tracing.go // 链路追踪
│   ├── redis // redis客户端
│   │   ├── redis.go
│   │   └── redis_middleware.go
│   ├── repository // 数据仓库处理逻辑
│   │   ├── access // access 相关表数据库操作逻辑实现包
│   │   │   ├── cache.go // 缓存
│   │   │   ├── logging.go // 日志
│   │   │   ├── service.go // 实现逻辑
│   │   │   └── tracing.go // 链路
│   │   ├── repository.go // 连接各个数据库、数据表的统一出入口，实现各各表操作逻辑初始化
│   │   └── types // 数据库表结构定义
│   │       ├── auth_access.go
│   │       ├── auth_resource.go
│   │       ├── auth_service.go
│   └── util // util包
│       ├── aes.go
├── tests // 单元测试
│   ├── README.md
│   ├── grpc_test.go
│   └── service_client_test.go
└── web // 前端文件
```

## 代码规范

### 格式化代码

Golang 代码使用 goimports 和 gofmt 进行代码格式化

### 命名规范

#### 文件名命名规范

用小写，尽量见名思义，看见文件名就可以知道这个文件下的大概内容，对于源代码里的文件，文件名要很好的代表了一个模块实现的功能。

src/ 目录下创建的是可公用的组件，src/pkg/下是各个功能模块，模块之间可以相互调用。

#### 包名

保持 package 的名字和目录保持一致，尽量采取有意义的包名，简短，有意义，尽量和标准库不要冲突。命名尽量不使用分隔符。

#### 模块包规范

新增加的模块必须在src/pkg目录下，每个模块只干该模块该干的事，基础文件有service.go、logging.go、endpoint.go、http.go、tracing.go、service_test.go

**logging.go 参考:**

```go
import (
	"context"
	"github.com/go-kit/kit/log"
	"github.com/go-kit/kit/log/level"
	"time"
)

type logging struct {
	logger  log.Logger
	next    Service
	traceId string
}

func (l *logging) Push(ctx context.Context, title, content, metrics, project, service string, level Level, silencePeriod int) (err error) {
	defer func(begin time.Time) {
		_ = l.logger.Log(
			l.traceId, ctx.Value(l.traceId),
			"method", "Push",
			"title", title,
			"content", content,
			"metrics", metrics,
			"project", project,
			"service", service,
			"level", level,
			"silencePeriod", silencePeriod,
			"took", time.Since(begin),
			"err", err,
		)
	}(time.Now())
	return l.next.Push(ctx, title, content, metrics, project, service, level, silencePeriod)
}

func NewLogging(logger log.Logger, traceId string) Middleware {
	logger = log.With(logger, "api.alarm", "logging")
	return func(next Service) Service {
		return &logging{
			logger:  level.Info(logger),
			next:    next,
			traceId: traceId,
		}
	}
}
```

**tracing.go 参考:**

```go
import (
	"context"
	"github.com/opentracing/opentracing-go"
	"github.com/opentracing/opentracing-go/ext"
)

type tracing struct {
	next   Service
	tracer opentracing.Tracer
}

func (s *tracing) Push(ctx context.Context, title, content, metrics, project, service string, level Level, silencePeriod int) (err error) {
	span, ctx := opentracing.StartSpanFromContextWithTracer(ctx, s.tracer, "Push", opentracing.Tag{
		Key:   string(ext.Component),
		Value: "Api.Alarm",
	})
	defer func() {
		span.LogKV(
			"title", title,
			"content", content,
			"metrics", metrics,
			"project", project,
			"service", service,
			"level", level,
			"silencePeriod", silencePeriod,
			"err", err)
		span.SetTag(string(ext.Error), err != nil)
		span.Finish()
	}()
	return s.next.Push(ctx, title, content, metrics, project, service, level, silencePeriod)
}

func NewTracing(otTracer opentracing.Tracer) Middleware {
	return func(next Service) Service {
		return &tracing{
			next:   next,
			tracer: otTracer,
		}
	}
}

```

service.go 里的每个方法必须带有一个logging方法，日志输打印入参入出参和错误信息。

#### 接口规范

定义一个接口：

```go
type Service interface {
   // Delete 删除Pod, 根据pod名称删除pod
   // clusterId: 中间件取得
   // ns: 空间标识
   // podName: 需要删除的pod名称
	Delete(ctx context.Context, clusterId int64, ns, podName string) (err error)
}
```

接口的实现：

```go
type Middleware func(Service) Service
type service struct {
	traceId   string
	logger    log.Logger
	k8sClient kubernetes.K8sClient
	config    *config.Config
}

func New(logger log.Logger, traceId string, k8sClient kubernetes.K8sClient, 
config *config.Config) Service {
	return &service{traceId, logger, k8sClient, config}
}

func (s *service) Delete(ctx context.Context, clusterId int64, ns, podName string) (err error) {
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
type ASDContext string
const (
	ContextKeyClusterName   ASDContext = "ctx-cluster-name"   // 集群名称
	ContextKeyClusterId     ASDContext = "ctx-cluster-id"     // 集群ID
	ContextKeyNamespaceName ASDContext = "ctx-namespace-name" // 空间标识
	ContextKeyNamespaceId   ASDContext = "ctx-namespace-id"   // 集群id
)
```

#### 错误处理命名

错误处理的原则就是不能丢弃任何有返回 err 的调用，不要采用_丢弃，必须全部处理。接收到错误，要么返回 err，并用 log记录下来。 error 的信息不要采用大写字母，尽量保持你的错误简短，但是要足够表达你的错误的意思。**所有的错误全部定义在src/encode/responsestatus.go上**

除了在man.go可以使用panic外，其于地方一率不得使用panic。

错误变量名以Err开头，接包名最后接具体的错误 Err{pkg}NotFound: xxx 未找到

命名参考：

```go

type ResStatus string
var ResponseMessage = map[ResStatus]int{
	ErrAccessSave:               2501,
	ErrAccessNotfound:           2502,
	ErrAccessResourceNotfound:   2503,
	ErrAccessResourceExpireTime: 2504,
}

const (
	ErrAccessSave               ResStatus = "保存失败"
	ErrAccessNotfound           ResStatus = "授权不存在"
	ErrAccessResourceNotfound   ResStatus = "授权资源不存在"
	ErrAccessResourceExpireTime ResStatus = "授权已过期"
)
```

> 未来被定义的错误信息会统一返回“系统错误”，并发出一条告警信息到统一告警中心。

**使用方式**

直接返回错误:

```
return encode.ErrAccessNotfound.Error()
```

拼接上层错误:

```
var err = errors.New("parent error.")
return encode.ErrAccessNotfound.Wrap(err)
```

返回字符串错误:

```
return encode.ErrAccessNotfound.String()
```
