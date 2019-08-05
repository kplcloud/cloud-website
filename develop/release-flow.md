# 发布流程

## 上传至 Docker 仓库

推荐使用make还行处理：

```makefile
APPNAME = kplcloud
BIN = $(GOPATH)/bin
GOCMD = /usr/local/go/bin/go
GOBUILD = $(GOCMD) build
GOINSTALL = $(GOCMD) install
GOCLEAN = $(GOCMD) clean
GOTEST = $(GOCMD) test
GOGET = $(GOCMD) get
GORUN = $(GOCMD) run
BINARY_UNIX = $(BIN)_unix
PID = .pid
HUB_ADDR = hub.kpaas.nsini.com
DOCKER_USER = 
DOCKER_PWD = 
TAG = v0.0.11-test
NAMESPACE = kpaas
PWD = $(shell pwd)

start:
	$(GOBUILD) -v
	$(BIN)/$(APPNAME) & echo $$! > $(PID)

restart:
	@echo restart the app...
	@kill `cat $(PID)` || true
	$(BIN)/$(APPNAME) & echo $$! > $(PID)

stop:
	@kill `cat $(PID)` || true

build-linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_UNIX) -v

login:
	docker login -u $(DOCKER_USER) -p $(DOCKER_PWD) $(HUB_ADDR)

build:
#	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -o kplcloud -v ./cmd/server/main.go
	docker build --rm -t $(APPNAME):$(TAG) .

docker-run:
	docker run -it --rm -p 8080:8080 -v $(PWD)/app.cfg:/etc/kplcloud/app.cfg -v $(PWD)/config_189.yaml:/etc/kplcloud/config.yaml $(APPNAME):$(TAG)

push:
	docker image tag $(APPNAME):$(TAG) $(HUB_ADDR)/$(NAMESPACE)/$(APPNAME):$(TAG)
	docker push $(HUB_ADDR)/$(NAMESPACE)/$(APPNAME):$(TAG)

run:
	GO111MODULE=on $(GORUN) ./cmd/server/main.go start -p :8080 -c ./app.cfg -k config_189.yaml
```

**Dockerfile：**

```dockerfile
FROM golang:latest as build-env

ENV GO111MODULE=on
ENV BUILDPATH=github.com/kplcloud/kplcloud
ENV GOPROXY=https://goproxy.io
ENV GOPATH=/go
RUN mkdir -p /go/src/${BUILDPATH}
COPY ./ /go/src/${BUILDPATH}
RUN cd /go/src/${BUILDPATH}/cmd/server && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go install -v

FROM alpine:latest

RUN apk update \
        && apk upgrade \
        && apk add --no-cache \
        ca-certificates \
        && update-ca-certificates 2>/dev/null || true

COPY --from=build-env /go/bin/server /go/bin/server
COPY ./static /go/bin/static

WORKDIR /go/bin/
CMD ["/go/bin/server", "start", "-p", ":8080", "-c", "/etc/kplcloud/app.cfg", "-k", "/etc/kplcloud/config.yaml"]
```

1. 编译

   ```bash
   $ make login
   $ make build
   ```

2. 上传至docker仓库

   ```bash
   $ make push
   ```

   