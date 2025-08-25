#!/usr/bin/env bash

# ---------- 拉取 OpenWrt 主线 ----------
CODE_DIR=_firmware_code
CODE_URL=https://git.openwrt.org/openwrt/openwrt.git
CODE_BRANCH=openwrt-24.10
git clone --single-branch -b $CODE_BRANCH $CODE_URL $CODE_DIR
mv ./$CODE_DIR/* ./

# ---------- 拉取插件源码 ----------
SUPPLY_DIR=_supply_packages
echo "src-link supply $PWD/$SUPPLY_DIR" >> feeds.conf.default
mkdir -p $SUPPLY_DIR && cd $SUPPLY_DIR

# IPv6 / NAT6
git clone --depth 1 https://github.com/Ausaci/luci-app-nat6-helper.git
# 广告屏蔽
git clone --depth 1 https://github.com/rufengsuixing/luci-app-adguardhome.git
# 网络加速
git clone --depth 1 https://github.com/chenmozhijin/turboacc.git
# DDNS-Go（Go 版）
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go.git
# 主题
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git
