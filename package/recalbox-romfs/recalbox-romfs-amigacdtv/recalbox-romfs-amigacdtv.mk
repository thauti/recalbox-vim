################################################################################
#
# recalbox-romfs-amigacdtv
#
################################################################################

# Package generated with :
# ./scripts/linux/empack.py --force --system amigacdtv --extension '.adf .Adf .ADF .uae' --fullname 'Amiga CDTV' --platform amigacdtv --theme amigacdtv 1:amiberry:amiberry:BR2_PACKAGE_AMIBERRY

# Name the 3 vars as the package requires
RECALBOX_ROMFS_AMIGACDTV_SOURCE = 
RECALBOX_ROMFS_AMIGACDTV_SITE = 
RECALBOX_ROMFS_AMIGACDTV_INSTALL_STAGING = NO
# Set the system name
SYSTEM_NAME_AMIGACDTV = amigacdtv
SYSTEM_XML_AMIGACDTV = $(@D)/$(SYSTEM_NAME_AMIGACDTV).xml
# System rom path
SOURCE_ROMDIR_AMIGACDTV = $(RECALBOX_ROMFS_AMIGACDTV_PKGDIR)/roms

# CONFIGGEN_STD_CMD is defined in recalbox-romfs, so take good care that
# variables are global across buildroot


ifneq ($(BR2_PACKAGE_AMIBERRY),)
define CONFIGURE_MAIN_AMIGACDTV_START
	$(call RECALBOX_ROMFS_CALL_ADD_SYSTEM,$(SYSTEM_XML_AMIGACDTV),Amiga CDTV,$(SYSTEM_NAME_AMIGACDTV),.adf .Adf .ADF .uae,amigacdtv,amigacdtv)
endef

ifneq ($(BR2_PACKAGE_AMIBERRY),)
define CONFIGURE_AMIGACDTV_AMIBERRY_START
	$(call RECALBOX_ROMFS_CALL_START_EMULATOR,$(SYSTEM_XML_AMIGACDTV),amiberry)
endef
ifeq ($(BR2_PACKAGE_AMIBERRY),y)
define CONFIGURE_AMIGACDTV_AMIBERRY_AMIBERRY_DEF
	$(call RECALBOX_ROMFS_CALL_ADD_CORE,$(SYSTEM_XML_AMIGACDTV),amiberry,1)
endef
endif

define CONFIGURE_AMIGACDTV_AMIBERRY_END
	$(call RECALBOX_ROMFS_CALL_END_EMULATOR,$(SYSTEM_XML_AMIGACDTV))
endef
endif



define CONFIGURE_MAIN_AMIGACDTV_END
	$(call RECALBOX_ROMFS_CALL_END_SYSTEM,$(SYSTEM_XML_AMIGACDTV),$(SOURCE_ROMDIR_AMIGACDTV),$(@D))
endef
endif

define RECALBOX_ROMFS_AMIGACDTV_CONFIGURE_CMDS
	$(CONFIGURE_MAIN_AMIGACDTV_START)
	$(CONFIGURE_AMIGACDTV_AMIBERRY_START)
	$(CONFIGURE_AMIGACDTV_AMIBERRY_AMIBERRY_DEF)
	$(CONFIGURE_AMIGACDTV_AMIBERRY_END)
	$(CONFIGURE_MAIN_AMIGACDTV_END)
endef

$(eval $(generic-package))
