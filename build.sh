#!/bin/bash

# set -e


# echo "Building OSX"
# GOOS=darwin GOARCH=amd64 go build -buildmode=c-archive -o products/osx.a riffle/runner/osx.go

# # rm osx/RiffleTest/osx.h osx/RiffleTest/osx.a
# mv products/osx.h osx/RiffleTest/osx.h 
# mv products/osx.a osx/RiffleTest/osx.a


echo "Building iOS"
gomobile bind -target=ios github.com/exis-io/riffle

rm -rf ios/Riffle.framework
mv Riffle.framework ios/Riffle.framework

# iOS naively like above. Doesn't work. 
# GOARM=7 CGO_ENABLED=1 GOARCH=arm go build -buildmode=c-archive -o products/ios.a riffle/runner/osx.go


# echo "Building Python"
# gopy bind -output=products github.com/exis-io/riffle