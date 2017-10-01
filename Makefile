include $(TOPDIR)/rules.mk

PKG_NAME:=cvserver
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define Package/cvserver
	SECTION:=cvserver
	CATEGORY:=WRTnode
	SUBMENU :=opencv_script
	TITLE:=opencv socket
	DEPENDS := +opencv
endef

define Package/cvserver/description
	opencv trough TCP/IP program for opencv lib
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		CFLAGS="$(TARGET_CFLAGS)"
endef

define Package/cvserver/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cvserver $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cvclient $(1)/usr/bin/
endef

$(eval $(call BuildPackage,cvserver))
