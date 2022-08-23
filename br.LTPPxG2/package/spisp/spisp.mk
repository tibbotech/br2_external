################################################################################
#
# spisp: ISPBOOOT assembly helper apps
#
################################################################################

SPISP_VERSION = $(call qstrip,$(BR2_PACKAGE_SPISP_VERSION))
SPISP_SITE = $(call github,tibbotech,plus1_isp,$(SPISP_VERSION))
SPISP_LICENSE = GPL-2.0
SPISP_AUTORECONF = NO
SPISP_INSTALL_IMAGES = YES
SPISP_INSTALL_TARGET = NO

define SPISP_CONFIGURE_CMDS
    echo "nothing"
endef

define SPISP_BUILD_CMDS
    cd $(@D)/tools/isp/ && $(MAKE)
endef

define SPISP_INSTALL_IMAGES_CMDS
    $(INSTALL) -d $(O)/images/sp_tools/secure_sign/sign_keys/test-keys/
    
    $(INSTALL) -p -m0755 $(@D)/tools/isp/isp $(O)/images/sp_tools/
    $(INSTALL) -p -m0755 $(@D)/isp.sh $(O)/images/sp_tools/
    $(INSTALL) -p -m0755 $(@D)/part.sh $(O)/images/sp_tools/
    $(INSTALL) -p -m0755 $(@D)/tools/add_uhdr.sh $(O)/images/sp_tools/

    $(INSTALL) -p -m0755 $(@D)/tools/secure_sign/gen_signature.sh $(O)/images/sp_tools/secure_sign/
    $(INSTALL) -p -m0755 $(@D)/tools/secure_sign/sign_ed25519 $(O)/images/sp_tools/secure_sign/
    $(INSTALL) -p -m0755 $(@D)/tools/secure_sign/sign_keys/readme.txt $(O)/images/sp_tools/secure_sign/sign_keys/
    $(INSTALL) -p -m0755 $(@D)/tools/secure_sign/sign_keys/test-keys/*.hex $(O)/images/sp_tools/secure_sign/sign_keys/test-keys/

    $(INSTALL) -p -m0755 $(@D)/tools/sdcard_boot/uEnv.txt $(O)/images/
endef

$(eval $(autotools-package))
$(eval $(host-autotools-package))
