Remove the Additive
===================

Follow these steps to permanently remove the additive:

#. Make the following changes on *vgw*:

    #. Mount ``/dev/sda1``::

        mount /dev/sda1 /mnt

    #. Edit the boot parameters::

        vi /mnt/boot/grub/grub.cfg

    #. Remove the ``additive=`` option to the linux line. The GRUB configuration should look similar to the following one::

        menuentry "PrimeLFS" {
            linux /vmlinuz-vgw console=tty0 console=ttyS0  ram=aram osarch=OS.tar.xz rootdelay=5 root=UUID=98803d54-6f84-47e4-8b2f-1e01af16b1ff   HWversion=2.0 rw
            initrd /initrd.img-vgw
        }

    #. Remove the additive::

        rm /mnt/vgw.tar.gz

    #. Umount ``dev/sda1``::

        umount /mnt

#. Factory reset the appliance and restart the machine using the buttons on the front of the appliance display.