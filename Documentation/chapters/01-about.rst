About the Additive
==================

This is a Quick Reference Handbook which explains how to use the dummy additive.

The dummy additive demonstrates how to create an additive for the PrimeKey hardware appliance platform, and it can be used as boilerplate when building your own additive.

Compatibility
-------------

The additive is designed for PrimeKey Hardware Appliance A2 firmware version 3.X. It can be installed directly on the hypervisor (sfp) as well as any of the following virtual machines:

- vgw
- vadm
- cos-ejbca
- cos-signserver (if present)

Additive Contents
-----------------

The additives contains a systemd service and a dummy script.

The file structure of the additive is as follows::

    ├── etc
    │   └── systemd
    │       └── system
    │           └── additive.service
    └── usr
        └── bin
            └── additive.sh
