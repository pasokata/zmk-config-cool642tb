.PHONY: build_left build_right build_reset
 
ZMK_CONFIG := /home/orca/codes/zmk-config-cool642tb
ZMK_MODULES := '/home/orca/codes/zmk-behavior-swapper;/home/orca/codes/zmk-pmw3610-driver;/home/orca/codes/zmk-config-cool642tb'
BOARD := seeeduino_xiao_ble
BUILD_FLAGS := -S "studio-rpc-usb-uart" -- -DZMK_EXTRA_MODULES=$(ZMK_MODULES)

build_left:
	west build -p -d build/left -b $(BOARD) $(BUILD_FLAGS) -DSHIELD="cool642tb_L" -DZMK_CONFIG=$(ZMK_CONFIG)

build_right:
	west build -p -d build/right -b $(BOARD) $(BUILD_FLAGS) -DSHIELD="cool642tb_R" -DZMK_CONFIG=$(ZMK_CONFIG)

build_reset:
	west build -p -d build/settings_reset -b $(BOARD) $(BUILD_FLAGS) -DSHIELD="settings_reset"
