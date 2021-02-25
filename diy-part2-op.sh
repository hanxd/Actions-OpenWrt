#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate

#echo '修改时区'
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

#echo '修改机器名称'
sed -i 's/OpenWrt/iNet/g' package/base-files/files/bin/config_generate
sed -i 's/US/CN/g ; s/OpenWrt/iNet/g ; s/none/psk-mixed/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/^EOF/i \            \set wireless.default_radio${devidx}.key=567890321' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./$1$GzaZpWin$e5M.CJ2ooGgDXrbQWltbd0/g' openwrt/package/lean/default-settings/files/zzz-default-settings

#echo 'Model '
sed -i 's/HNET C108/Mifi/g' target/linux/ramips/dts/mt7620a_hnet_c108.dts
sed -i 's/wwan0/usb0/g' target/linux/ramips/mt7620/base-files/etc/board.d/01_leds

#=================================================
# 主题DIY并拉取最新版
cd openwrt/package
git clone https://github.com/jerrykuku/luci-theme-argon.git
git clone https://github.com/jerrykuku/luci-app-argon-config.git
popd
#=================================================

#=================================================
# EC20.patches
pushd target/linux/ramips/patches-5.4
rm -rf 997-hxd-ec20.patch
wget https://github.com/hanxd/extd/releases/download/V1/997-hxd-ec20.patch
popd
#=================================================

#echo 'Netgearrainbow'
# ln -s ../../../luci-theme-netgearrainbow ./package/lean/

# Server酱
git clone https://github.com/tty228/luci-app-serverchan.git package/mine/luci-app-serverchan

# luci-app-modeminfo
# git clone https://github.com/koshev-msk/luci-app-atinout.git package/mine/luci-app-atinout
# git clone https://github.com/koshev-msk/luci-app-mmconfig.git package/mine/luci-app-mmconfig
git clone https://github.com/koshev-msk/luci-app-modeminfo.git package/mine/luci-app-modeminfo
git clone https://github.com/koshev-msk/luci-app-smstools3.git package/mine/luci-app-smstools3
