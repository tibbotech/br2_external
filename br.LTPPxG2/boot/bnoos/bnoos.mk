################################################################################
#
# bnoos: arm926 stand-alone app code example
#
################################################################################

BNOOS_VERSION = $(call qstrip,$(BR2_TARGET_BNOOS_VERSION))
BNOOS_SITE = $(call github,tibbotech,plus1_Bnoos,$(BNOOS_VERSION))
BNOOS_LICENSE = GPL-2.0
BNOOS_INSTALL_IMAGES = YES
BNOOS_INSTALL_TARGET = NO

define BNOOS_BUILD_CMDS
    $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS="$(TARGET_CROSS)"
endef

define BNOOS_INSTALL_IMAGES_CMDS
    install -p -m0644 $(@D)/bin/rom.bin $(O)/images/a926.bin
    touch $(O)/images/a926-empty.bin
    # add_uhdr
endef

$(eval $(generic-package))
