#!/usr/bin/env bash
set -x

TAG=latest
VERSION=2.3.0


build() {
   URL="https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=/spark/spark-${VERSION}/spark-${VERSION}-bin-hadoop2.7.tgz"
   docker build --build-arg URL=$URL --label io.github.flokkr.spark.version=$VERSION -t flokkr/spark:${TAG} .
}

deploy() {
	docker push flokkr/spark:${TAG}
}

while getopts ":v:t:" opt; do
  case $opt in
    v)
      VERSION=$OPTARG >&2
      ;;
    t)
      TAG=${OPTARG:-$VERSION}
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done


shift $(($OPTIND -1))
eval $*
