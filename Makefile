ifneq ($(KERNELRELEASE),)
ccflags-y := -std=gnu99 -Wno-declaration-after-statement
obj-m := newKeyLog.o
else
KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

modules:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
endif

clean:
	rm -rf *.o *~ *.ko *.mod.c Module.* *.order
