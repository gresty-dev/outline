#!/bin/sh
. ./env.sh
FROM_IMAGE=outlinewiki/$IMAGE:$IMAGE_VERSION
BUILT_IMAGE=$REGISTRY/$IMAGE-$SUFFIX:$IMAGE_VERSION
step ca root $CA_ROOT
docker buildx build --platform linux/amd64 --build-arg FROM_IMAGE=$FROM_IMAGE --build-arg CA_ROOT=$CA_ROOT -t $BUILT_IMAGE .
rm $CA_ROOT