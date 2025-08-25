#!/usr/bin/env bash

# 拷贝初始化脚本
mkdir -p files/etc/uci-defaults
cp $(dirname $0)/uci-scripts/* files/etc/uci-defaults/ 2>/dev/null || true

# 把 dnsmasq 换成 dnsmasq-full
if ! grep -q "dnsmasq-full" include/target.mk; then
    sed -i 's/dnsmasq/dnsmasq-full/g' include/target.mk
fi

# 强制在 .config 里选上核心包（如果 menuconfig 没勾上）
echo "CONFIG_PACKAGE_ipv6helper=y"          >> .config
echo "CONFIG_PACKAGE_luci-proto-ipv6=y"     >> .config
echo "CONFIG_PACKAGE_kmod-ipt-nat6=y"       >> .config
echo "CONFIG_PACKAGE_luci-app-nat6-helper=y">> .config
echo "CONFIG_PACKAGE_luci-app-adguardhome=y">> .config
echo "CONFIG_PACKAGE_adguardhome=y"         >> .config
echo "CONFIG_PACKAGE_luci-app-turboacc=y"   >> .config
echo "CONFIG_PACKAGE_luci-app-ddns-go=y"    >> .config
