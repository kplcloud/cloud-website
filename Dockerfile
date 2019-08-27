FROM kplcloud/gitbook:v3.2.3 AS build_env

MAINTAINER dudulu <solacowa@gmail.com>

COPY ./ /opt/gitbook

WORKDIR /opt/gitbook

RUN gitbook build

FROM nginx:1.17.3-alpine

COPY --from=build_env /opt/gitbook/_book/ /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]
