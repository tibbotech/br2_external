################################################################################
#
# spmake: Make-script to asseembly ISPBOOT.BIN
#
################################################################################

SPMAKE_VERSION = 0
SPMAKE_SITE = $(BR2_EXTERNAL_LTPPxG2_PATH)/package/spmake/files
SPMAKE_SITE_METHOD = local
HOST_SPMAKE_DEPENDENCIES = host-make
SPMAKE_LICENSE = GPL-2.0
SPMAKE_INSTALL_IMAGES = YES
SPMAKE_INSTALL_TARGET = NO

define SPMAKE_INSTALL_IMAGES_CMDS
    $(INSTALL) -p -m0755 $(@D)/run_spmake.sh $(O)/images/
    $(INSTALL) -p -m0644 $(@D)/sp_make.mk $(O)/images/
    $(INSTALL) -p -m0644 $(@D)/sp_make.inc.mk $(O)/images/
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
