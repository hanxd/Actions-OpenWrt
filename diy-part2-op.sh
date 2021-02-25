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
