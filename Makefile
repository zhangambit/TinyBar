packages::
	$(ECHO_NOTHING)echo$(ECHO_END)

include $(THEOS)/makefiles/common.mk

THEOS_BUILD_DIR = build

SUBPROJECTS = preferences
SUBPROJECTS += tweak
include $(THEOS_MAKE_PATH)/aggregate.mk

after-stage::
	$(ECHO_NOTHING)find $(THEOS_STAGING_DIR) -iname '*.plist' -exec plutil -convert binary1 {} \;$(ECHO_END)
	$(ECHO_NOTHING)find $(THEOS_STAGING_DIR) -iname '*.png' -exec pincrush -i {} \;$(ECHO_END)
	$(ECHO_NOTHING)find $(THEOS_STAGING_DIR) -name '*.DS_Store' -type f -exec rm {} \;$(ECHO_END)
after-install::
	@install.exec "killall -9 SpringBoard"
