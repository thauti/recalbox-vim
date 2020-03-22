################################################################################
#
# mali-bitfrost
#
################################################################################

MALI_BITFROST_VERSION = r12p04
MALI_BITFROST_SITE = $(call github,thauti,recalbox-bitfrost-mali-userspace,master)

MALI_BITFROST_INSTALL_STAGING = YES
MALI_BITFROST_DEPENDENCIES = mali-opengles-sdk
MALI_BITFROST_PROVIDES = libegl libgles

MALI_BITFROST_TARGET_DIR=$(TARGET_DIR)
MALI_BITFROST_STAGING_DIR=$(STAGING_DIR)

define MALI_BITFROST_INSTALL_STAGING_CMDS
	@mkdir -p $(MALI_BITFROST_STAGING_DIR)
	@cp -r $(@D)/* $(MALI_BITFROST_STAGING_DIR)
endef

define MALI_BITFROST_INSTALL_TARGET_CMDS
	@mkdir -p $(MALI_BITFROST_TARGET_DIR)
	@cp -r $(@D)/* $(MALI_BITFROST_TARGET_DIR)
endef

$(eval $(generic-package))
