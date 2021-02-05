#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# sed -i '$a src-git vpasswall https://github.com/xiaorouji/openwrt-passwall.git' feeds.conf.default


#!/bin/sh

# all commands involving downloads are run twice to ensure all files are downloaded

# uncomment the two lines below if you are using Linux Mint 18

#sudo apt-get install build-essential subversion git-core libncurses5-dev zlib1g-dev gawk flex quilt libssl-dev xsltproc libxml-parser-perl quilt
#sudo apt-get install build-essential subversion git-core libncurses5-dev zlib1g-dev gawk flex quilt libssl-dev xsltproc libxml-parser-perl quilt

# uncomment the two lines below if you are using Ubuntu 18.04.1

#sudo apt -y install build-essential libncurses5-dev python unzip gawk git curl
#sudo apt -y install build-essential libncurses5-dev python unzip gawk git curl

# uncomment the two lines below if you are using Debian

#sudo apt install build-essential git unzip ncurses-dev libz-dev libssl-dev openssl-1.0-dev python python3-dev python3.5 libelf-dev subversion gettext gawk wget curl rsync perl
#sudo apt install build-essential git unzip ncurses-dev libz-dev libssl-dev openssl-1.0-dev python python3-dev python3.5 libelf-dev subversion gettext gawk wget curl rsync perl

# other versions of Linux will need different dependancies added in order to work

# git clone https://git.openwrt.org/openwrt/openwrt.git rooter18067
# cp rooter-master.tar.gz /openwrt
# cd openwrt
git fetch --tags
git tag -l 
git checkout v18.06.7
./scripts/feeds update -a
./scripts/feeds update -a
./scripts/feeds install -a

# untar the rooter-master.tgz into the new build directory
tar -zxvf ../rooter-master.tar.gz -C ./

# Create the images folder, since it wont be captured since it is empty and the build scripts dont create it
mkdir -p ./images
