.PHONY: release debug test clean



GENERATOR=
ifeq ($(GEN),ninja)
	GENERATOR=-G "Ninja"
	FORCE_COLOR=-DFORCE_COLORED_OUTPUT=1
endif

ODBC_CONFIG_FLAG=
ifneq ($(ODBC_CONFIG),)
	ODBC_CONFIG_FLAG=-DODBC_CONFIG=${ODBC_CONFIG}
endif

OSX_BUILD_UNIVERSAL_FLAG=
ifneq ($(OSX_BUILD_UNIVERSAL),)
	OSX_BUILD_UNIVERSAL_FLAG=-DOSX_BUILD_UNIVERSAL=1
endif

release:
	mkdir -p build/release
	cd build/release && cmake -DCMAKE_BUILD_TYPE=Release $(GENERATOR) $(ODBC_CONFIG_FLAG) $(OSX_BUILD_UNIVERSAL_FLAG) ../.. && cmake --build . --config Release

debug:
	mkdir -p build/debug
	cd build/debug && cmake -DCMAKE_BUILD_TYPE=Debug $(GENERATOR) $(ODBC_CONFIG_FLAG) $(OSX_BUILD_UNIVERSAL_FLAG) ../.. && cmake --build . --config Debug


clean:
	rm -rf build