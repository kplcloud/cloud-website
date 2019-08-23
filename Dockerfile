FROM node:10.16.3-alpine AS build_env

MAINTAINER dudulu <solacowa@gmail.com>

ARG VERSION=3.2.3

RUN npm config set registry https://registry.npm.taobao.org

RUN npm install -g gitbook-cli

COPY ./ /opt/gitbook

WORKDIR /opt/gitbook

RUN gitbook fetch ${VERSION}
RUN gitbook build

FROM nginx:1.17.3-alpine

COPY --from=build_env /opt/gitbook/_book/* /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]
