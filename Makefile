.PHONY : all clean build
.SUFFIX: .config .cpcfg .build .install .clean
.DEFAULT_GOAL=all

-include mk_config/*.conf
-include mk_build/*.build

all: build install

clean: clean_image
	rm -rf $(OUTPUT)

clean_image:
	rm -rg $(IMAGE)

view_variable:
	$(shell make -pn | grep -A1 "^# makefile")

build: build_boot build_kernel build_apps

build_boot:
	@for n in $(BOOT); do \
	    echo Build $$n; \
	    make $$n.build || exit 1; \
	done

build_kernel:
	@for n in $(KERNEL); do \
	    echo Build $$n; \
	    make $$n.build || exit 1; \
	done

build_apps:
	@for n in $(APPLICATION); do \
	    echo Build $$n; \
	    make $$n.build || exit 1; \
	done

install: install_boot install_kernel install_apps


install_boot:
	@for n in $(BOOT); do \
	    echo Install $$n; \
	    make $$n.install || exit 1; \
	done

install_kernel:
	@for n in $(KERNEL); do \
	    echo Install $$n; \
	    make $$n.install || exit 1; \
	done

install_apps:
	@for n in $(APPLICATION); do \
	    echo Install $$n; \
	    make $$n.install || exit 1; \
	done



%.config:
	@$(call BUILD_WITH_CONFIG,$*,config) || exit 1;

%.cpcfg:
	@$(call BUILD_WITH_CONFIG,$*,cpcfg) || exit 1;

%.install:
	@$(call BUILD_WITH_CONFIG,$*,install) || exit 1;

%.clean:
	@$(call BUILD_WITH_CONFIG,$*,clean) || exit 1;

%.build:
	$(call BUILD_WITH_CONFIG,$*,build)

