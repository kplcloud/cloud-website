# Introduction

## 开普勒使用教程

本教程主要围绕 Kplcloud 的安装，集成发布。

教程由 宜人财富 技术创新团队 提供技术支持

#### Kplcloud是什么?

kplcloud是一个基于Kubernetes的轻量级PaaS平台，通过可视化的界面对应用进行管理，降低应用容器化的对度，从而减少应用容器化的时间成本。

Kplcloud已在服务于宜人财富多个团队，稳定运行了近两年，目前平台已在生产环境跑着上百个应用，近千个容器。  



## 本地启动文档库

1. 克隆

   ```bash
   $ git clone https://github.com/kplcloud/cloud-website.git
   ```

2. Docker启动

   ```bash
   $ docker build --rm -t cloud-website .
   $ docker run -it --rm -p 80:80 cloud-website
   ```

3. 访问 浏览器打开`http://localhost`即可访问。