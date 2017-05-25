FROM alpine

RUN apk add --no-cache go git musl-dev bash
RUN git clone -b r3.4.4 https://github.com/mongodb/mongo-tools.git /mongo-tools

RUN  cd /mongo-tools && \
     . ./set_gopath.sh && \
     go build -o /usr/bin/mongodump mongodump/main/mongodump.go

RUN rm -fr /mongo-tools && \
    apk del go git musl-dev bash
