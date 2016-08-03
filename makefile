link_img:clean FORCE
	$(Q)$(MAKE) -f ./Makefile ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
	BOOTARGS='"root=/dev/vda ip=dhcp rw console=ttyAMA0 maxcpus=1"' \
	FDT_SRC=foundation-v8.dts IMAGE=image-foundation_img.axf

link_nfs:clean FORCE
	$(Q)$(MAKE) -f ./Makefile ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
    BOOTARGS='"root=/dev/nfs nfsroot=10.10.30.57:/srv/nfsroot,nfsvers=3,proto=tcp,timeo=600,retrans=5,hard,intr,nolock,rsize=524288,wsize=524288 ip=dhcp     rw console=ttyAMA0 maxcpus=1"' \
	FDT_SRC=foundation-v8.dts IMAGE=image-foundation_NFS.axf

clean:
	$(Q)$(MAKE) -f ./Makefile clean
	rm -f image-foundation_img.axf
	rm -f image-foundation_NFS.axf

FORCE:

.PHONY: FORCE
