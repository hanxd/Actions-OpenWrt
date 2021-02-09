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
sed -i 's/OpenWrt/CPE.iNet/g' package/base-files/files/bin/config_generate

#echo 'DHCP'
sed -i '/mwan/i uci set network.RNDIS=interface' package/lean/default-settings/files/zzz-default-settings
sed -i '/mwan/i uci set network.RNDIS.ifname=usb0' package/lean/default-settings/files/zzz-default-settings
sed -i '/mwan/i uci set network.RNDIS.proto=dhcp' package/lean/default-settings/files/zzz-default-settings
sed -i '/mwan/i uci commit network' package/lean/default-settings/files/zzz-default-settings
sed -i "/mwan/i uci set firewall.@zone[1].network='wan wan6 RNDIS'" package/lean/default-settings/files/zzz-default-settings
sed -i '/mwan/i uci commit firewall' package/lean/default-settings/files/zzz-default-settings

# sed -i 's/OpenWrt/iNetHotspot/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/OpenWrt/iNet/g ; s/none/psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/^EOF/i \            \set wireless.default_radio${devidx}.key=567890321' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./$1$GzaZpWin$e5M.CJ2ooGgDXrbQWltbd0/g' openwrt/package/lean/default-settings/files/zzz-default-settings

sed -i 's/7552k/15872k/g' target/linux/ramips/image/mt7620.mk
sed -i 's/760000/f80000/g' target/linux/ramips/dts/mt7620n_zbtlink_zbt-cpe102.dts
sed -i 's/mt7620n-soc/mt7620a-soc/g' target/linux/ramips/dts/mt7620n_zbtlink_zbt-cpe102.dts
sed -i 's/mt7620n.dtsi/mt7620a.dtsi/g' target/linux/ramips/dts/mt7620n_zbtlink_zbt-cpe102.dts
# sed -i '/zbtlink_zbt-cpe102/{s/7552k))$/15872k))/;}' target/linux/ramips/image/mt7620.mk
# sed -i '58,80s/read-only;/#' target/linux/ramips/dts/mt7620n_zbtlink_zbt-cpe102.dts

# echo '集成diy目录'
# ln -s ../../diy ./package/openwrt-packages

# echo 'hotspot'
# cp -f ../luci-app-hotspot package/lean/
# git clone https://github.com/hanxd/extd.git package/mine/luci-app-hotspot

#echo 'art.dts'
# sed -i 's/#size-cells = <1>;/partition@ff0000 {label = "art";reg = <0xff0000 0x10000>;};/' target/linux/ramips/dts/mt7620n_zbtlink_zbt-cpe102.dts

#echo '删除旧版mt7620.mk,链接新版'
# rm -rf ./target/linux/ramips/image/mt7620.mk
# ln -s ../../../Dir/mt7620.mk ./target/linux/ramips/image/mt7620.mk
# cp -f ../Dir/mt7620.mk ./target/linux/ramips/image/mt7620.mk

#echo 'quectel'
ln -s ../../../quectel ./package/lean/

# Server酱
git clone https://github.com/tty228/luci-app-serverchan.git package/mine/luci-app-serverchan

