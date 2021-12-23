#!/bin/sh

# Dependencies
# pip3 install jinja2-cli

VM="vgw"

mkdir -p _build
cp -r $VM _build/

jinja2 _build/$VM/etc/systemd/system/additive.service.j2 data.json --format=json > _build/$VM/etc/systemd/system/additive.service

sudo chown -R 0:0 _build/$VM

cd _build/$VM
sudo tar -czf $VM.tar.gz *
sudo mv $VM.tar.gz ../../
cd -

sudo rm -rf _build