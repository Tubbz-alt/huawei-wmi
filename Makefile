obj-m := huawei-wmi.o

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

all: build

build:
	$(MAKE) -C $(KERNELDIR) M=$(PWD)

install:
	mkdir -p $(DESTDIR)/usr/lib/modules-load.d
	echo "huawei-wmi" | tee $(DESTDIR)/usr/lib/modules-load.d/huawei-wmi.conf

clean:
	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
	rm -rf .tmp_versions
	rm -f Module.symvers
	rm -f modules.order
