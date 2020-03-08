FROM golang:1.14-buster

ARG  VERSION=3.11.4
ARG  URL_PROTOC=https://github.com/protocolbuffers/protobuf/releases/download/v${VERSION}/protoc-${VERSION}-linux-x86_64.zip

RUN  apt update && \
     apt -y install ca-certificates unzip && \
     apt clean

RUN  go get -u -v google.golang.org/grpc && \
     go get -u -v github.com/golang/protobuf/protoc-gen-go

RUN  curl -sSL -o /tmp/out.zip ${URL_PROTOC} && \
     cd /tmp && \
     unzip out.zip && \
     cp -fv bin/* /usr/local/bin/ && \
     cp -rfv include/* /usr/local/include && \
     rm -rf /tmp/*
