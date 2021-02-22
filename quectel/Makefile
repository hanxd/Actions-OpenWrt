include $(TOPDIR)/rules.mk

PKG_NAME:=quectel
PKG_VERSION:=1.000
PKG_BUILD_DIR:= $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=quectel pppd firmware
	PKGARCH:=all
	DEPENDS:= +libpthread +kmod-usb-net +kmod-usb-net-qmi-wwan +kmod-usb-wdm +kmod-usb-serial +kmod-usb-serial-option +kmod-usb-serial-wwan +wwan
endef

define Package/$(PKG_NAME)/description
	quectel firmware 
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/quectel-CM $(1)/usr/bin/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))