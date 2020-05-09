#!/bin/sh

BUILD_VERSION=$(svn info --xml > /tmp/revision && expr substr `head -13 /tmp/revision|grep "revision"` 11 4)
BUILD_DATE=$(date +%Y%m%d_%T)
BUILD_BY="$(whoami)"

#if you want make those infomations to you make or gcc you can try this line
#DEFS += -D_ARM_ -DFIXED_POINT=32 -D_REVISION=$(BUILD_VERSION) -D_BUILD_DATE=$(BUILD_DATE) -D_BUILD_BY=$(BUILD_BY)

echo "BUILD_VERSION = " $BUILD_VERSION
echo "BUILD_DATE = " $BUILD_DATE
echo "BUILD_BY = " $BUILD_BY
