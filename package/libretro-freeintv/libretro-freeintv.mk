################################################################################
#
# FREEINTV
#
################################################################################

LIBRETRO_FREEINTV_VERSION = df7f7f83d1bb56b25553d81d2f279c078883502a
LIBRETRO_FREEINTV_SITE = $(call github,libretro,FreeIntv,$(LIBRETRO_FREEINTV_VERSION))

define LIBRETRO_FREEINTV_BUILD_CMDS
	$(SED) "s|-O2|-O3|g" $(@D)/Makefile
	CFLAGS="$(TARGET_CFLAGS) $(COMPILER_COMMONS_CFLAGS_NOLTO)" \
		CXXFLAGS="$(TARGET_CXXFLAGS) $(COMPILER_COMMONS_CXXFLAGS_NOLTO)" \
		LDFLAGS="$(TARGET_LDFLAGS) $(COMPILER_COMMONS_LDFLAGS_NOLTO)" \
		$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" LD="$(TARGET_CXX)" AR="$(TARGET_AR)" RANLIB="$(TARGET_RANLIB)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_FREEINTV_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/freeintv_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/freeintv_libretro.so
endef

$(eval $(generic-package))
