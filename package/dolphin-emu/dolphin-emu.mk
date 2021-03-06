################################################################################
#
# DOLPHIN_EMU
#
################################################################################

#Version:5.0-11333
DOLPHIN_EMU_VERSION = 15fc71cfcf5f94221443aaff99ae559fa3cb4633
DOLPHIN_EMU_SITE = $(call github,dolphin-emu,dolphin,$(DOLPHIN_EMU_VERSION))
DOLPHIN_EMU_LICENCE = GPLv2+
DOLPHIN_EMU_DEPENDENCIES = xserver_xorg-server libevdev ffmpeg zlib libpng lzo libusb libcurl sfml bluez5_utils qt5base hidapi
DOLPHIN_EMU_SUPPORTS_IN_SOURCE_BUILD = NO
# bluez is disable otherwise a compilation error appears
#DOLPHIN_EMU_CONF_OPTS = -DOPENGL_INCLUDE_DIR=$(STAGING_DIR)/usr/include

DOLPHIN_EMU_CONF_OPTS += -DDISTRIBUTOR='Recalbox'
DOLPHIN_EMU_CONF_OPTS += -DENABLE_LTO=ON
DOLPHIN_EMU_CONF_OPTS += -DENABLE_EGL=OFF
DOLPHIN_EMU_CONF_OPTS += -DENABLE_NOGUI=OFF
DOLPHIN_EMU_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
DOLPHIN_EMU_CONF_OPTS += -DTHREADS_PTHREAD_ARG=ON
DOLPHIN_EMU_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
DOLPHIN_EMU_CONF_OPTS += -DCMAKE_C_ARCHIVE_CREATE="<CMAKE_AR> qcs <TARGET> <LINK_FLAGS> <OBJECTS>"
DOLPHIN_EMU_CONF_OPTS += -DCMAKE_C_ARCHIVE_FINISH=true
DOLPHIN_EMU_CONF_OPTS += -DCMAKE_CXX_ARCHIVE_CREATE="<CMAKE_AR> qcs <TARGET> <LINK_FLAGS> <OBJECTS>"
DOLPHIN_EMU_CONF_OPTS += -DCMAKE_CXX_ARCHIVE_FINISH=true
DOLPHIN_EMU_CONF_OPTS += -DCMAKE_AR="$(TARGET_CC)-ar"
DOLPHIN_EMU_CONF_OPTS += -DCMAKE_C_COMPILER="$(TARGET_CC)"
DOLPHIN_EMU_CONF_OPTS += -DCMAKE_CXX_COMPILER="$(TARGET_CXX)"
DOLPHIN_EMU_CONF_OPTS += -DCMAKE_C_FLAGS="$(COMPILER_COMMONS_CFLAGS_EXE)"
DOLPHIN_EMU_CONF_OPTS += -DCMAKE_LINKER="$(TARGET_LD)"
DOLPHIN_EMU_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(COMPILER_COMMONS_CXXFLAGS_EXE)"
DOLPHIN_EMU_CONF_OPTS += -DCMAKE_LINKER_EXE_FLAGS="$(COMPILER_COMMONS_LDFLAGS_EXE)"

$(eval $(cmake-package))
