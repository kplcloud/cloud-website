# 在Kubernetes创建新的空间



> 建议将与开普勒相关的服务独立到一个专有的 Namespace下，您可以执行以下命令创建该空间



```bash
$ kubectl create namespace kpaas
```

或执行以下命令 ：

```bash
$ kubectl apply -f install/kubernetes/namespace.yaml
```

