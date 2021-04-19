################################################################################
#
# xboot-sptools: some ISPBOOOT assemble helper tools
#
################################################################################

XBOOT_SPTOOLS_VERSION = 1bfe8238e3f067ac2c35d5c2ac76accbfd3b837b
XBOOT_SPTOOLS_SITE = $(call github,tibbotech,plus1_xboot,$(XBOOT_SPTOOLS_VERSION))
XBOOT_SPTOOLS_LICENSE = GPL-2.0
XBOOT_SPTOOLS_INSTALL_IMAGES = YES
XBOOT_SPTOOLS_INSTALL_TARGET = NO

define XBOOT_SPTOOLS_INSTALL_IMAGES_CMDS
    $(INSTALL) -d $(O)/images/sp_tools/tools/
    $(INSTALL) -m0755 $(@D)/add_xhdr.sh $(O)/images/sp_tools/
    $(INSTALL) -m0755 $(@D)/tools/tcpsum $(O)/images/sp_tools/tools/
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
