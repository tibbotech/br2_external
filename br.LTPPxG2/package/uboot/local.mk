################################################################################
#
# U-Boot additional: Hook for Plus1 custom u-boot to install mkimage
#
################################################################################

define UBOOT_INST_MKIMAGE
    $(INSTALL) -d $(O)/images/sp_tools/tools/
    $(INSTALL) -p -m0755 $(@D)/tools/mkimage $(O)/images/sp_tools/mkimage
endef
UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INST_MKIMAGE