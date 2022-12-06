#!/bin/bash

#docker run -itd --name=dns --net=host dns:latest
docker run -itd --name=dns -p 8080:3000 -p 53:53/udp dns:latest
