TARGET    := iphone:clang:latest:14.0
ARCHS     := arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = EverLight

EverLight_FILES      = EverLight/Tweak.mm
EverLight_FRAMEWORKS = UIKit CoreGraphics Foundation CoreFoundation QuartzCore
EverLight_CFLAGS     = -fobjc-arc \
                       -Wno-unused-variable \
                       -Wno-deprecated-declarations \
                       -Wno-unused-parameter
EverLight_LDFLAGS    = -lsubstrate

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
