################################################################################
#
# OPERA
#
################################################################################

LIBRETRO_OPERA_VERSION = 27bc2653ed469072a6a95102a8212a35fbb1e590
LIBRETRO_OPERA_SITE = $(call github,libretro,opera-libretro,$(LIBRETRO_OPERA_VERSION))

ifeq ($(BR2_PACKAGE_RECALBOX_TARGET_RPI3),y)
LIBRETRO_OPERA_PLATFORM=rpi3
LIBRETRO_OPERA_PLATFORM_CPU=cortex-a53
LIBRETRO_OPERA_PLATFORM_OPT=-mfpu=neon-vfpv4 -fdata-sections -ffunction-sections -Wl,--gc-sections -fno-unroll-loops -fmerge-all-constants
else ifeq ($(BR2_PACKAGE_RECALBOX_TARGET_XU4),y)
LIBRETRO_OPERA_PLATFORM=odroidxu4
LIBRETRO_OPERA_PLATFORM_CPU=cortex-a5
LIBRETRO_OPERA_PLATFORM_OPT=-mfpu=neon-vfpv4 -fdata-sections -ffunction-sections -Wl,--gc-sections -fno-unroll-loops -fmerge-all-constants
endif

define LIBRETRO_OPERA_MAKEFILE_PATCHING
	$(SED) "s|-O2|-O3|g" $(@D)/Makefile
endef
#-fno-stack-protector -fno-ident -fno-unwind-tables -fno-asynchronous-unwind-tables
LIBRETRO_OPERA_PRE_CONFIGURE_HOOKS += LIBRETRO_OPERA_MAKEFILE_PATCHING

define LIBRETRO_OPERA_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS) $(COMPILER_COMMONS_CFLAGS_SO) -DARM" \
		CXXFLAGS="$(TARGET_CXXFLAGS) $(COMPILER_COMMONS_CXXFLAGS_SO) -DARM" \
		LDFLAGS="$(TARGET_LDFLAGS) $(COMPILER_COMMONS_LDFLAGS_SO)" \
		$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="unix"
endef

define LIBRETRO_OPERA_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/opera_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/opera_libretro.so
endef

$(eval $(generic-package))
