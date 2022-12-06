#!/bin/bash
img="dns:latest"

#docker buildx build --REPOSITORY=IrineSistiana/mosdns --platform linux/amd64 -t $img .
docker buildx build --platform linux/amd64 -t $img .
