#!/bin/bash

# set -e


# echo "Building OSX"
# GOOS=darwin GOARCH=amd64 go build -buildmode=c-archive -o products/osx.a goriffle/runner/osx.go

# # rm osx/RiffleTest/osx.h osx/RiffleTest/osx.a
# mv products/osx.h osx/RiffleTest/osx.h 
# mv products/osx.a osx/RiffleTest/osx.a


# echo "Building iOS"
# GOGCCFLAGS="--Wl,-no_pie" gomobile bind -ldflags="-extldflags=-pie" -target=ios -work github.com/exis-io/goriffle
# rm -rf ios/Goriffle.framework
# mv Goriffle.framework ios/Goriffle.framework


# iOS naively like above. Doesn't work. 
# GOARM=7 CGO_ENABLED=1 GOARCH=arm go build -buildmode=c-archive -o products/ios.a goriffle/runner/osx.go


# echo "Building Python"
# GOOS=darwin GOARCH=amd64 go build -buildmode=c-shared -o python/libriff.so goriffle/runner/osx.go

echo "Building js"
gopherjs build -m goriffle/runner/jsRiffle.go

rm js/jsRiffle.js js/jsRiffle.js.map

mv jsRiffle.js js/jsRiffle.js
mv jsRiffle.js.map js/jsRiffle.js.map