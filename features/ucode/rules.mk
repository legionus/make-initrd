.PHONY: ucode

ucode: $(call if_feature,compress)
	@$(MSG) "Adding CPU microcode ..."
	@$(FEATURESDIR)/ucode/bin/add-ucode
	@if [ -s "$(WORKDIR)/ucode.cpio" ]; then \
		cat "$(WORKDIR)/initrd.img" >> "$(WORKDIR)/ucode.cpio"; \
		mv -f $(verbose) -- "$(WORKDIR)/ucode.cpio" "$(WORKDIR)/initrd.img"; \
	fi

install: ucode
