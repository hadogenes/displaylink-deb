VERSION=$(shell dpkg-parsechangelog | sed -nr '/^Version:/s/Version: (.*)-(.*)/\1/p')
RELEASE=$(shell dpkg-parsechangelog | sed -nr '/^Version:/s/Version: (.*)-(.*)/\2/p')
DOWNLOAD_ID=993 # This id number comes off the link on the displaylink website

TARGETS = displaylink_$(VERSION)-$(RELEASE)_amd64.deb

all: $(TARGETS)

clean:
	rm -f $(TARGETS) v$(VERSION).tar.gz

DisplayLink\ USB\ Graphics\ Software\ for\ Ubuntu\ $(VERSION).zip:
	wget --post-data="fileId=$(DOWNLOAD_ID)&accept_submit=Accept" -O DisplayLink\ USB\ Graphics\ Software\ for\ Ubuntu\ $(VERSION).zip http://www.displaylink.com/downloads/file?id=$(DOWNLOAD_ID)

displaylink_$(VERSION).orig.tar.gz: DisplayLink\ USB\ Graphics\ Software\ for\ Ubuntu\ $(VERSION).zip
	unzip DisplayLink\ USB\ Graphics\ Software\ for\ Ubuntu\ $(VERSION).zip
	chmod +x displaylink-driver-$(VERSION).run
	./displaylink-driver-$(VERSION).run --keep --noexec
	mv displaylink-driver-$(VERSION) displaylink-$(VERSION)
	tar -czf displaylink_$(VERSION).orig.tar.gz displaylink-$(VERSION)

displaylink_$(VERSION)-$(RELEASE)_amd64.deb: displaylink_$(VERSION).orig.tar.gz
	test -d displaylink-$(VERSION) || tar -xzf displaylink_$(VERSION).orig.tar.gz
	cd displaylink-$(VERSION) && \
		cp -r ../debian . && \
		debuild -us -uc
