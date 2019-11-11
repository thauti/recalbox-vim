################################################################################
#
# uboot-vim
#
################################################################################

UBOOT_VIM_VERSION = vim3l-uboot-2015.01
UBOOT_VIM_SITE = $(call github,thauti,vim3l-uboot,master)
UBOOT_VIM_INSTALL_TARGET = NO
UBOOT_VIM_INSTALL_IMAGES = YES

define UBOOT_VIM_INSTALL_IMAGES_CMDS
	cp -dpf $(@D)/u-boot.bin.sd.bin \
		$(BINARIES_DIR)
endef
$(eval $(generic-package))
