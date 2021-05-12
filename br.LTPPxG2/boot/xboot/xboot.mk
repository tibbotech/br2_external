################################################################################
#
# xboot 1-level Bootloader
#
################################################################################

XBOOT_VERSION = b2210ec08e53432c2d9f29b7dbed5e7ddcb56959
XBOOT_SITE = $(call github,tibbotech,plus1_xboot,$(XBOOT_VERSION))
XBOOT_LICENSE = GPL-2.0
XBOOT_INSTALL_IMAGES = YES
XBOOT_INSTALL_TARGET = NO

XBOOT_DRAM_VERSION = 31a770b7163b6ccf52545e2f0440c7fd68615ddd
XBOOT_EXTRA_DOWNLOADS = $(call github,tibbotech,plus1_draminit,$(XBOOT_DRAM_VERSION))/dram-$(XBOOT_DRAM_VERSION).tar.gz
 
define XBOOT_EXTRACT_DRAM
    tar xzf $(XBOOT_DL_DIR)/dram-$(XBOOT_DRAM_VERSION).tar.gz -C $(@D)/../
    ln -sf -T $(@D)/../plus1_draminit-$(XBOOT_DRAM_VERSION) $(@D)/../draminit
endef
XBOOT_POST_EXTRACT_HOOKS += XBOOT_EXTRACT_DRAM

define XBOOT_BUILD_CMDS
    install $(@D)/configs/$(BR2_TARGET_XBOOT_CONFIG) $(@D)/.config
    ln -sf -T $(@D) $(@D)/../xboot
    $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PLATFORM=$(BR2_TARGET_XBOOT_CONFIG) CROSS="$(TARGET_CROSS)"
endef

define XBOOT_INSTALL_IMAGES_CMDS
    install -p -m0644 $(@D)/bin/xboot.bin $(O)/images/
    # add signature
    # add_xhdr
endef

$(eval $(generic-package))
