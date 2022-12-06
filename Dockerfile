FROM --platform=${TARGETPLATFORM} golang:alpine as builder
ARG CGO_ENABLED=0
ARG TAG=v4.5.3
ARG REPOSITORY=IrineSistiana/mosdns
WORKDIR /root
RUN apk add --update git \
	&& git clone https://github.com/${REPOSITORY} mosdns \
	&& cd ./mosdns \
	&& git fetch --all --tags \
	&& git checkout tags/${TAG} \
	&& go build -ldflags "-s -w -X main.version=${TAG}" -trimpath -o mosdns

FROM adguard/adguardhome:latest
LABEL maintainer="sk"
COPY --from=builder /root/mosdns/mosdns /usr/bin/
ADD mosdns /etc/mosdns
COPY start.sh /opt/start.sh
#RUN /opt/start.sh
EXPOSE 53/tcp 53/udp 3000/tcp
ENTRYPOINT ["/opt/start.sh"]
