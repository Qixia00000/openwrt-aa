#!/usr/bin/env bash

# 1. 拉取 OpenWrt 主线源码
CODE_DIR=_firmware_code
CODE_URL=https://git.openwrt.org/openwrt/openwrt.git
CODE_BRANCH=openwrt-24.10
git clone --single-branch -b $CODE_BRANCH $CODE_URL $CODE_DIR
mv ./$CODE_DIR/* ./

# 2. 建立本地 feeds 目录
SUPPLY_DIR=_supply_packages
echo "src-link supply $PWD/$SUPPLY_DIR" >> feeds.conf.default
mkdir -p $SUPPLY_DIR && cd $SUPPLY_DIR

# 以下仅 clone 你在 .config 里真正用到的插件
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git
# adblock / adblock-fast / ddns / dnscrypt-proxy 等官方源已自带，无需额外 clone
