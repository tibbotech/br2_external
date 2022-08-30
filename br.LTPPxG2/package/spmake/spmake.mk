################################################################################
#
# spmake: Make-script to asseembly ISPBOOT.BIN
#
################################################################################

SPMAKE_VERSION = main
SPMAKE_SITE = $(call github,tibbotech,spmake,$(SPMAKE_VERSION))
HOST_SPMAKE_DEPENDENCIES = host-make
SPMAKE_LICENSE = GPL-2.0
SPMAKE_INSTALL_IMAGES = YES
SPMAKE_INSTALL_TARGET = NO

define SPMAKE_INSTALL_IMAGES_CMDS
    $(INSTALL) -p -m0644 $(@D)/sp_make.mk $(O)/images/
    $(INSTALL) -p -m0644 $(@D)/sp_make.inc.mk $(O)/images/
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
