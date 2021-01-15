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
# sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate

# sed -i 's/OpenWrt/iNetHotspot/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/OpenWrt/iNet/g ; s/none/psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/^EOF/i \            \set wireless.default_radio${devidx}.key=1234567890' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./$1$GzaZpWin$e5M.CJ2ooGgDXrbQWltbd0/g' openwrt/package/lean/default-settings/files/zzz-default-settings
# sed -i '/^exit 0/i echo 0xDEADBEEF > /etc/config/google_fu_mode' openwrt/package/lean/default-settings/files/zzz-default-settings

# sed -i 's/7552k/15872k/g' target/linux/ramips/image/mt7620.mk
# sed -i 's/760000/f80000/g' target/linux/ramips/dts/mt7620n_zbtlink_zbt-cpe102.dts
# sed -i 's/7552k/15872k/g ; s/mt7620n/mt7620a/g' target/linux/ramips/image/mt7620.mk
# sed -i '/zbtlink_zbt-cpe102/{s/7552k))$/15872k))/;}' target/linux/ramips/image/mt7620.mk

#echo '删除旧版mt7620.mk,链接新版'
rm -rf ./target/linux/ramips/image/mt7620.mk
ln -s ../../../Dir/mt7620.mk ./target/linux/ramips/image

rm -rf ./target/linux/ramips/dts/mt7620n_zbtlink_zbt-cpe102.dts
ln -s ../../../Dir/mt7620n_zbtlink_zbt-cpe102.dts ./target/linux/ramips/dts
ln -s ../../../Dir/mt7620a_zbtlink_zbt-cpe102.dts ./target/linux/ramips/dts

#echo 'quectel'
ln -s ../../../quectel ./package/lean/
