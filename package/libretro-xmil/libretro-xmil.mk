################################################################################
#
# XMIL
#
################################################################################

LIBRETRO_XMIL_VERSION = a31e7b38ced8d53b3d3db7088d60fb0a9d5adc93
LIBRETRO_XMIL_SITE = $(call github,libretro,xmil-libretro,$(LIBRETRO_XMIL_VERSION))

define LIBRETRO_XMIL_BUILD_CMDS
	$(SED) "s|--export-all-symbols||g" $(@D)/libretro/Makefile.libretro
	$(SED) "s|-O2|-O3|g" $(@D)/libretro/Makefile.libretro
	CFLAGS="$(TARGET_CFLAGS) $(COMPILER_COMMONS_CFLAGS_SO)" \
		CXXFLAGS="$(TARGET_CXXFLAGS) $(COMPILER_COMMONS_CXXFLAGS_SO)" \
		LDFLAGS="$(TARGET_LDFLAGS) $(COMPILER_COMMONS_LDFLAGS_SO)" \
		$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretro/ -f Makefile.libretro platform="unix"
endef

define LIBRETRO_XMIL_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/libretro/x1_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/xmil_libretro.so
	mkdir -p $(TARGET_DIR)/recalbox/share_init/bios/xmil
endef

$(eval $(generic-package))
