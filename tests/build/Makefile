TOPDIR  ?= $(realpath $(CURDIR)/../..)
TESTDIR ?= $(TOPDIR)/.tests

include $(TOPDIR)/tests/Makefile.testsuite

TESTCASE_COMMAND = \
	$(QEMU_BIN) \
	    $(QEMU_STAGE0_ARGUMENTS) \
	    $(QEMU_STAGE0_DRIVES) \
	    -kernel '$(QEMU_STAGE0_VMLINUZ)' \
	    -initrd '$(QEMU_STAGE0_INITRAMFS)' \
	    -append '$(QEMU_STAGE0_CMDLINE)' \

#-drive 'media=disk,file=$(CURDIR)/rootfs-altlinux-20200622.qcow2'

build: qemu-stage0
	@$(TRAVIS_START) "build.make-initrd"
	@echo "$(TESTCASE): Building make-initrd ... "
	$(TRAVIS_Q)echo "$(TESTCASE)" > $(TESTDIR)/cur;
	$(TRAVIS_Q)echo "check" > $(TESTDIR)/mode;
	$(TRAVIS_Q)timeout --foreground -- 10m \
	$(QEMU_FILTER) --logfile=$(TESTDIR)/log.build -- \
	$(QEMU_BIN) \
	    $(QEMU_STAGE0_ARGUMENTS) \
	    $(QEMU_STAGE0_DRIVES) \
	    -kernel '$(QEMU_STAGE0_VMLINUZ)' \
	    -initrd '$(QEMU_STAGE0_INITRAMFS)' \
	    -append '$(QEMU_STAGE0_CMDLINE)';
	@$(TRAVIS_STOP)

