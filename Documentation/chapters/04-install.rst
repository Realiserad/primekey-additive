Install the Additive
====================

Follow these steps to install the additive in vgw.

#. Enable SSH access in WebConf.
#. Move the additive *vgw.tar.gz* to ``/root`` on *vgw*.
#. Make the following changes on *vgw*:

    #. Mount ``/dev/sda1``::

        mount /dev/sda1 /mnt

    #. Copy the additive::

        cp /root/vgw.tar.gz /mnt/

    #. Edit the boot parameters::

        vi /mnt/boot/grub/grub.cfg

    #. Add the ``additive=`` option to the linux line. The GRUB configuration should look similar to the following one::

        menuentry "PrimeLFS" {
            linux /vmlinuz-vdb console=tty0 console=ttyS0  ram=aram osarch=OS.tar.xz additive=vgw.tar.gz rootdelay=5 root=UUID=98803d54-6f84-47e4-8b2f-1e01af16b1ff   HWversion=2.0 rw
            initrd /initrd.img-vgw
        }

    #. Unmount ``dev/sda1``::

        umount /mnt

    #. Restart *vgw* to load the additive::

        reboot

#. The service bundled with the additive is dormant after installation. To start it, run the following command in vgw::

    systemctl enable additive.service --now