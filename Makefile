.DEFAULT: build

BINARY=get_tweets
VERSION=`git describe --tags`

OS := $(shell uname)
ifeq ($(OS), Darwin)
    MD5_CMD = md5
else
    MD5_CMD = md5sum
endif

LDFLAGS=-ldflags "-X main.Version=${VERSION}"

install:
	go install ./...

build_local:
	go build ${LDFLAGS} -o "dist/${BINARY}" "./cmd/get_tweets/"

run:
	make build_local ; ./dist/${BINARY} -config resources/config.json
#
#build_amd64:
#	env GOOS=linux GOARCH=amd64 go build ${LDFLAGS} -o "dist/linux/${BINARY}" "./cmd/get_tweets/" && $(MD5_CMD) "dist/linux/${BINARY}" > "dist/linux/${BINARY}_md5.txt"
#
#build_arm64:
#	env GOOS=linux GOARCH=arm64 go build ${LDFLAGS} -o "dist/linux/${BINARY}" "./cmd/get_tweets/" && $(MD5_CMD) "dist/linux/${BINARY}" > "dist/linux/${BINARY}_md5.txt"


test:
	go test $$(go list ./...|grep -v vendor)

vtest:
	go test -v $$(go list ./...|grep -v vendor)
