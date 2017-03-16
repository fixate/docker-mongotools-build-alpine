FROM alpine

RUN apk add --no-cache go git musl-dev bash
RUN git clone -b r3.4.2 https://github.com/mongodb/mongo-tools.git

WORKDIR mongo-tools

VOLUME /target

CMD . ./set_gopath.sh && go build -o /target/mongodump mongodump/main/mongodump.go && go build -o /target/mongorestore mongorestore/main/mongorestore.go