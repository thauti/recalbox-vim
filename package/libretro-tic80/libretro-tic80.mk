################################################################################
#
# TIC-80
#
################################################################################

LIBRETRO_TIC80_VERSION = b3e158c15997beba019aa02cfad3c7d70caca84e
LIBRETRO_TIC80_SITE = git://github.com/nesbox/TIC-80.git
LIBRETRO_TIC80_LICENSE = MIT
LIBRETRO_TIC80_GIT_SUBMODULES=y

LIBRETRO_TIC80_CONF_OPTS=-DBUILD_SDL=OFF \
						-DBUILD_SOKOL=OFF \
						-DBUILD_LIBRETRO=ON \
						-DBUILD_DEMO_CARTS=OFF \
						-DBUILD_PRO=ON

define LIBRETRO_TIC80_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/lib/tic80_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/tic80_libretro.so
endef

LIBRETRO_TIC80_CONF_OPTS += -DCMAKE_C_ARCHIVE_CREATE="<CMAKE_AR> qcs <TARGET> <LINK_FLAGS> <OBJECTS>"
LIBRETRO_TIC80_CONF_OPTS += -DCMAKE_C_ARCHIVE_FINISH=true
LIBRETRO_TIC80_CONF_OPTS += -DCMAKE_CXX_ARCHIVE_CREATE="<CMAKE_AR> qcs <TARGET> <LINK_FLAGS> <OBJECTS>"
LIBRETRO_TIC80_CONF_OPTS += -DCMAKE_CXX_ARCHIVE_FINISH=true
LIBRETRO_TIC80_CONF_OPTS += -DCMAKE_AR="$(TARGET_CC)-ar"
LIBRETRO_TIC80_CONF_OPTS += -DCMAKE_C_COMPILER="$(TARGET_CC)"
LIBRETRO_TIC80_CONF_OPTS += -DCMAKE_CXX_COMPILER="$(TARGET_CXX)"
LIBRETRO_TIC80_CONF_OPTS += -DCMAKE_LINKER="$(TARGET_LD)"
LIBRETRO_TIC80_CONF_OPTS += -DCMAKE_C_FLAGS="$(COMPILER_COMMONS_CFLAGS_SO)"
LIBRETRO_TIC80_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(COMPILER_COMMONS_CXXFLAGS_SO)"
LIBRETRO_TIC80_CONF_OPTS += -DCMAKE_LINKER_EXE_FLAGS="$(COMPILER_COMMONS_LDFLAGS_SO)"

$(eval $(cmake-package))