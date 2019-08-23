FROM node:latest

MAINTAINER dudulu <solacowa@gmail.com>

RUN npm config set registry https://registry.npm.taobao.org && npm install --global gitbook-cli &&\
​	npm cache clear &&\
​	rm -rf /tmp/*

COPY ./ /opt/gitbook

WORKDIR /opt/gitbook

RUN /usr/local/bin/gitbook build

FROM nginx:1.17.3-alpine

COPY --from=build-env /opt/gitbook/_book/* /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]

