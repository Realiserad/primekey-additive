#!/bin/sh

# Dependencies:
#
#  sudo apt install sshpass

# The management IP address of the appliance where the additive should 
# be installed. The management IP address is shown on the front display.
MGMT_IP=

# The SSH password as specified in WebConf.
SSH_PASSWORD=

# The VM in which the additive is installed (vgw, vadm, cos-ejbca or cos-signserver).
# Set to "sfp" to install the additive directly on the hypervisor.
VM="vgw"

sshpass -p "$SSH_PASSWORD" scp $VM.tar.gz root@$MGMT_IP:
sshpass -p "$SSH_PASSWORD" ssh -q root@$MGMT_IP scp $VM.tar.gz root@$VM:
sshpass -p "$SSH_PASSWORD" ssh -q root@$MGMT_IP ssh -q root@$VM mount /dev/sda1 /mnt
sshpass -p "$SSH_PASSWORD" ssh -q root@$MGMT_IP ssh -q root@$VM cp /root/$VM.tar.gz /mnt/
if sshpass -p "$SSH_PASSWORD" ssh -q root@$MGMT_IP ssh -q root@$VM "grep -q additive /mnt/boot/grub/grub.cfg"; then
    echo "Additive already loaded!"
else
    sshpass -p "$SSH_PASSWORD" ssh root@$MGMT_IP ssh -q root@$VM "sed -i 's/ram=aram/ram=aram additive=vgw.tar.gz/g' /mnt/boot/grub/grub.cfg"
    echo "Additive installed!"
fi
sshpass -p "$SSH_PASSWORD" ssh -q root@$MGMT_IP ssh -q root@$VM umount /mnt
sshpass -p "$SSH_PASSWORD" ssh -q root@$MGMT_IP ssh -q root@$VM reboot