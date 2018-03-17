VERSION ?= latest
URL ?= "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=/spark/spark-2.3.0/spark-2.3.0-bin-hadoop2.7.tgz"

build:
	docker build --no-cache --build-arg URL=$(URL) -t flokkr/spark:$(VERSION) .

deploy:
	docker push flokkr/spark:$(VERSION)

.PHONY: deploy build

