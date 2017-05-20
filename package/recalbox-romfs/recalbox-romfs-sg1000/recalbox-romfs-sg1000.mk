################################################################################
#
# recalbox-romfs-sg1000
#
################################################################################

# Package generated with :
# ./scripts/linux/empack.py --system sg1000 --extension '.sg .SG .zip .ZIP' --fullname 'Sega SG1000' --platform sg1000 --theme sg1000 libretro:genesisplusgx:BR2_PACKAGE_LIBRETRO_GENESISPLUSGX libretro:picodrive:BR2_PACKAGE_LIBRETRO_PICODRIVE

# Name the 3 vars as the package requires
RECALBOX_ROMFS_SG1000_SOURCE = 
RECALBOX_ROMFS_SG1000_SITE = 
RECALBOX_ROMFS_SG1000_INSTALL_STAGING = NO
# Set the system name
SYSTEM_NAME_SG1000 = sg1000
SYSTEM_XML_SG1000 = $(@D)/$(SYSTEM_NAME_SG1000).xml
# System rom path
SOURCE_ROMDIR_SG1000 = $(RECALBOX_ROMFS_SG1000_PKGDIR)/roms

# CONFIGGEN_STD_CMD is defined in recalbox-romfs, so take good care that
# variables are global across buildroot


ifneq ($(BR2_PACKAGE_LIBRETRO_GENESISPLUSGX)$(BR2_PACKAGE_LIBRETRO_PICODRIVE),)
define CONFIGURE_MAIN_SG1000_START
	$(call RECALBOX_ROMFS_CALL_ADD_SYSTEM,$(SYSTEM_XML_SG1000),Sega SG1000,$(SYSTEM_NAME_SG1000),.sg .SG .zip .ZIP,sg1000,sg1000)
endef

ifneq ($(BR2_PACKAGE_LIBRETRO_GENESISPLUSGX)$(BR2_PACKAGE_LIBRETRO_PICODRIVE),)
define CONFIGURE_SG1000_LIBRETRO_START
	$(call RECALBOX_ROMFS_CALL_START_EMULATOR,$(SYSTEM_XML_SG1000),libretro)
endef
ifeq ($(BR2_PACKAGE_LIBRETRO_GENESISPLUSGX),y)
define CONFIGURE_SG1000_LIBRETRO_GENESISPLUSGX_DEF
	$(call RECALBOX_ROMFS_CALL_ADD_CORE,$(SYSTEM_XML_SG1000),genesisplusgx)
endef
endif

ifeq ($(BR2_PACKAGE_LIBRETRO_PICODRIVE),y)
define CONFIGURE_SG1000_LIBRETRO_PICODRIVE_DEF
	$(call RECALBOX_ROMFS_CALL_ADD_CORE,$(SYSTEM_XML_SG1000),picodrive)
endef
endif

define CONFIGURE_SG1000_LIBRETRO_END
	$(call RECALBOX_ROMFS_CALL_END_EMULATOR,$(SYSTEM_XML_SG1000))
endef
endif



define CONFIGURE_MAIN_SG1000_END
	$(call RECALBOX_ROMFS_CALL_END_SYSTEM,$(SYSTEM_XML_SG1000),$(SOURCE_ROMDIR_SG1000),$(@D))
endef
endif

define RECALBOX_ROMFS_SG1000_CONFIGURE_CMDS
	$(CONFIGURE_MAIN_SG1000_START)
	$(CONFIGURE_SG1000_LIBRETRO_START)
	$(CONFIGURE_SG1000_LIBRETRO_GENESISPLUSGX_DEF)
	$(CONFIGURE_SG1000_LIBRETRO_PICODRIVE_DEF)
	$(CONFIGURE_SG1000_LIBRETRO_END)
	$(CONFIGURE_MAIN_SG1000_END)
endef

$(eval $(generic-package))