#!/usr/bin/env bash

# 1. 复制初始化脚本（可选）
mkdir -p files/etc/uci-defaults
cp $(dirname $0)/uci-scripts/* files/etc/uci-defaults/ 2>/dev/null || true

# 2. 默认用 dnsmasq-full
if ! grep -q "dnsmasq-full" include/target.mk; then
    sed -i 's/dnsmasq/dnsmasq-full/g' include/target.mk
fi

# 3. 确保关键包被编译
cat >> .config <<EOF
CONFIG_PACKAGE_dnsmasq-full=y
CONFIG_PACKAGE_adblock=y
CONFIG_PACKAGE_adblock-fast=y
CONFIG_PACKAGE_bird1-ipv6=y
CONFIG_PACKAGE_ddns-scripts=y
CONFIG_PACKAGE_ddns-scripts-services=y
CONFIG_PACKAGE_dnscrypt-proxy2=y
CONFIG_PACKAGE_nextdns-client=y
EOF
