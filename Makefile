APPNAME = cloud-website 
HUB_ADDR = hub.kpaas.nsini.com
DOCKER_USER =
DOCKER_PWD =
TAG = v0.1.48-test
NAMESPACE = kpaas

build:
	docker build --rm -t $(APPNAME):$(TAG) .

docker-run:
	docker run -it --rm -p 80:80 $(APPNAME):$(TAG)

push:
	docker image tag $(APPNAME):$(TAG) $(HUB_ADDR)/$(NAMESPACE)/$(APPNAME):$(TAG)
	docker push $(HUB_ADDR)/$(NAMESPACE)/$(APPNAME):$(TAG)
