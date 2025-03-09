#!/bin/sh

make clean
ARCHS="arm64" PLATFORM_NAME="iphoneos" make

xcodebuild -create-xcframework -library out/libwg-go.a -output out/WireGuardKitGoBinary.xcframework

cd out
zip -r WireGuardKitGoBinary.xcframework.zip WireGuardKitGoBinary.xcframework
swift package compute-checksum WireGuardKitGoBinary.xcframework.zip