Build the Additive
==================

The additive must be built on a Linux system where you have root access. Passwordless sudo is recommended.

#. Install Jinja2 CLI using Python's package manager::

    pip3 install jinja2-cli

#. Update ``data.json`` with a description of the additive.

#. Run the build script to build the additive::

    ./create_additive.sh