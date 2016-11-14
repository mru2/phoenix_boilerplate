IMG_NAME = mru2/phoenix-test
APP_NAME = api
VERSION = 0.0.1

.PHONY: all compile unpack build clean push

all: compile unpack build clean push

compile:
	docker build -t build-img -f Dockerfile.build .
	docker create --name build-cont build-img
	docker cp build-cont:/src/rel/api/releases/$(VERSION)/$(APP_NAME).tar.gz ./rel/$(APP_NAME).tar.gz
	docker rm build-cont
	docker rmi build-img

unpack:
	tar -xzf rel/$(APP_NAME).tar.gz -C rel
	rm rel/$(APP_NAME).tar.gz

build:
	docker build -t $(IMG_NAME):latest .

clean:
	rm -rf rel/*

push:
	docker push $(IMG_NAME):latest
