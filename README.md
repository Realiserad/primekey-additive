Additive, what?
===============

What is an additive?
--------------------

An additive allows you to add your own modifications to the [PrimeKey hardware appliance platform](https://www.primekey.com/products/ejbca-hardware-appliance).

The hardware appliance platform is based on Linux, but the file system is a RAM disk. Normally only changes in ``/etc`` are persisted across reboots and if the appliance platform is reset, all changes are lost.

How does it work?
-----------------

The additive should be packaged in a tarball and added to GRUB. It will then be extracted on top of the firmware when the appliance boots.

This makes it possible to add your own files without signing your own firmware.

Gimme the goodies
=================

This repository contains an example additive with corresponding build and installation scripts, which you can use as boilerplate when creating your own. 

Building your own additive from scratch is not hard, but there are a few things to keep in mind unless you want to waste time on trial and error, such as setting correct permissions on files before packaging the additive.

In addition to the example additive, there is a template for writing a manual using RST and Sphinx.

Build
-----

To just build the additive without making any changes, do the following:

1. This repository uses a Jinja2 template, because they are awesome. If you don't have Jinja2 CLI, you need to install it:

    pip3 install jinja2-cli

2. Clone this repository and then open the *Additive* folder. Then run the build script. Note that unless you have set up passwordless sudo it will ask you for the sudo password in order to set some file permissions:

    sh ./create_additive.sh 

3. The additive is packaged into a file called *vgw.tar.gz*. As the name suggests it is instended to be installed in the virtual machine called *virtual gateway* or *vgw*.

Install
-------

To actually install the additive, there is a small installation script which uses SSH access with a password to install the additive. You can enable SSH access in WebConf.

To run the script, do the following:

1. Install sshpass. On Ubuntu, you can run:

    sudo apt install sshpass

2. Edit the parameters in the script. You need to put the management IP address as shown on the front display of your appliance, as well as the SSH password.

3. Then just run the script. It will reboot *vgw* at the end, so you'll need to wait for a few seconds before the appliance becomes responsive again.

    sh ./install_additive.sh

Build the handbook
------------------

Some more information is available in the handbook. To build it on Ubuntu, run something like the following:

    sudo apt install texlive-full make
    pip3 install sphinx
    make latexpdf

RIP, support contract
=====================

PrimeKey does not support your additive. If you break the appliance, you need to pay for an RMA or boot from a USB stick and reflash the firmware yourself.

When booting with a display hooked into the box, you'll see that there are two firmware sets. If you mess up the appliance and you cannot boot from the first firmware set, you can always switch to the second one and remove the additive.
