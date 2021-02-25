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

#arpbind
svn co https://github.com/QiuSimons/OpenWrt_luci-app/trunk/lean/luci-app-arpbind package/lean/luci-app-arpbind
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-arpbind package/lean/luci-app-arpbind
#patch -p1 < ../PATCH/new/package/arpbind.patch
#Adbyby
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-adbyby-plus package/lean/luci-app-adbyby-plus
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/adbyby package/lean/adbyby
#访问控制
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-accesscontrol package/lean/luci-app-accesscontrol
cp -rf ../PATCH/duplicate/luci-app-control-weburl ./package/new/luci-app-control-weburl
#网易云解锁
git clone --depth 1 https://github.com/immortalwrt/luci-app-unblockneteasemusic.git package/new/UnblockNeteaseMusic
#定时重启
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-autoreboot package/lean/luci-app-autoreboot
#ChinaDNS
git clone -b luci --depth 1 https://github.com/pexcn/openwrt-chinadns-ng.git package/new/luci-app-chinadns-ng
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/new/chinadns-ng
#SSRP
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/lean/luci-app-ssr-plus
rm -rf ./package/lean/luci-app-ssr-plus/po/zh_Hans
pushd package/lean
#wget -qO - https://patch-diff.githubusercontent.com/raw/fw876/helloworld/pull/271.patch | patch -p1
popd
sed -i 's,default n,default y,g' package/lean/luci-app-ssr-plus/Makefile
sed -i 's,Xray:xray ,Xray:xray-core ,g' package/lean/luci-app-ssr-plus/Makefile
sed -i '/V2ray:v2ray/d' package/lean/luci-app-ssr-plus/Makefile
sed -i '/plugin:v2ray/d' package/lean/luci-app-ssr-plus/Makefile
sed -i '/result.encrypt_method/a\result.fast_open = "1"' package/lean/luci-app-ssr-plus/root/usr/share/shadowsocksr/subscribe.lua
sed -i 's,ispip.clang.cn/all_cn.txt,cdn.jsdelivr.net/gh/QiuSimons/Chnroute/dist/chnroute/chnroute.txt,g' package/lean/luci-app-ssr-plus/root/etc/init.d/shadowsocksr
sed -i 's,YW5vbnltb3Vz/domain-list-community@release/gfwlist.txt,Loyalsoldier/v2ray-rules-dat@release/gfw.txt,g' package/lean/luci-app-ssr-plus/root/etc/init.d/shadowsocksr
#SSRP依赖
rm -rf ./feeds/packages/net/xray-core
rm -rf ./feeds/packages/net/kcptun
rm -rf ./feeds/packages/net/shadowsocks-libev
rm -rf ./feeds/packages/net/proxychains-ng
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/shadowsocksr-libev package/lean/shadowsocksr-libev
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/pdnsd-alt package/lean/pdnsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/kcptun package/lean/kcptun
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/srelay package/lean/srelay
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/microsocks package/lean/microsocks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/dns2socks package/lean/dns2socks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/redsocks2 package/lean/redsocks2
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/proxychains-ng package/lean/proxychains-ng
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ipt2socks package/lean/ipt2socks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/simple-obfs package/lean/simple-obfs
svn co https://github.com/coolsnowwolf/packages/trunk/net/shadowsocks-libev package/lean/shadowsocks-libev
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/trojan package/lean/trojan
svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/lean/tcpping package/lean/tcpping
svn co https://github.com/fw876/helloworld/trunk/naiveproxy package/lean/naiveproxy
svn co https://github.com/fw876/helloworld/trunk/ipt2socks-alt package/lean/ipt2socks-alt
#PASSWALL
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/new/luci-app-passwall
sed -i 's,default n,default y,g' package/new/luci-app-passwall/Makefile
sed -i '/V2ray:v2ray/d' package/new/luci-app-passwall/Makefile
sed -i '/plugin:v2ray/d' package/new/luci-app-passwall/Makefile
cp -f ../PATCH/new/script/move_2_services.sh ./package/new/luci-app-passwall/move_2_services.sh
pushd package/new/luci-app-passwall
bash move_2_services.sh
popd
rm -rf ./feeds/packages/net/https-dns-proxy
svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy feeds/packages/net/https-dns-proxy
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/new/tcping
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/new/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/new/brook
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/new/trojan-plus
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks package/new/ssocks
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray-core package/new/xray-core
svn co https://github.com/fw876/helloworld/trunk/xray-core package/new/xray-core
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray package/new/v2ray
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-plugin package/new/v2ray-plugin
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray-plugin package/new/xray-plugin
#luci-app-cpulimit
cp -rf ../PATCH/duplicate/luci-app-cpulimit ./package/lean/luci-app-cpulimit
svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/ntlf9t/cpulimit package/lean/cpulimit
#清理内存
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-ramfree package/lean/luci-app-ramfree
#打印机
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-usb-printer package/lean/luci-app-usb-printer
#流量监视
git clone -b master --depth 1 https://github.com/brvphoenix/wrtbwmon.git package/new/wrtbwmon
git clone -b master --depth 1 https://github.com/brvphoenix/luci-app-wrtbwmon.git package/new/luci-app-wrtbwmon
#流量监管
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-netdata package/lean/luci-app-netdata
#OpenClash
git clone -b master --depth 1 https://github.com/vernesong/OpenClash.git package/new/luci-app-openclash
#SeverChan
git clone -b master --depth 1 https://github.com/tty228/luci-app-serverchan.git package/new/luci-app-serverchan
#上网APP过滤
git clone -b master --depth 1 https://github.com/destan19/OpenAppFilter.git package/new/OpenAppFilter
#Docker
sed -i 's/+docker-ce/+docker \\\n\t+dockerd/g' ./feeds/luci/applications/luci-app-dockerman/Makefile
#ipv6-helper
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ipv6-helper package/lean/ipv6-helper
#IPSEC
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-ipsec-vpnd package/lean/luci-app-ipsec-vpnd
#UPNP（回滚以解决某些沙雕设备的沙雕问题
rm -rf ./feeds/packages/net/miniupnpd
svn co https://github.com/coolsnowwolf/packages/trunk/net/miniupnpd feeds/packages/net/miniupnpd
#KMS
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-vlmcsd package/lean/luci-app-vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/vlmcsd package/lean/vlmcsd
#腾讯DDNS
#svn co https://github.com/Tencent-Cloud-Plugins/tencentcloud-openwrt-plugin-ddns/trunk/tencentcloud_ddns package/lean/luci-app-tencentddns
svn co https://github.com/1715173329/tencentcloud-openwrt-plugin-ddns/trunk/tencentcloud_ddns package/lean/luci-app-tencentddns
#阿里DDNS
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-aliddns package/new/luci-app-aliddns
#WOL
svn co https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-services-wolplus package/new/luci-app-services-wolplus

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

# luci-app-modeminfo
# git clone https://github.com/koshev-msk/luci-app-atinout.git package/mine/luci-app-atinout
# git clone https://github.com/koshev-msk/luci-app-mmconfig.git package/mine/luci-app-mmconfig
git clone https://github.com/koshev-msk/luci-app-modeminfo.git package/mine/luci-app-modeminfo
git clone https://github.com/koshev-msk/luci-app-smstools3.git package/mine/luci-app-smstools3
