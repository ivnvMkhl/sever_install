#!/bin/bash

VERSION=1.8.2;

curl -L -O "https://github.com/prometheus/node_exporter/releases/download/v$VERSION/node_exporter-$VERSION.linux-amd64.tar.gz"
tar -xvf ./node_exporter-$VERSION.linux-amd64.tar.gz
cp -r ./node_exporter-$VERSION.linux-amd64 ./node_exporter_bin/
chmod +x ./node_exporter_bin/node_exporter
rm -rf ./node_exporter-$VERSION.linux-amd64 ./node_exporter-$VERSION.linux-amd64.tar.gz

cat > node_exporter.service << EOM
[Unit]
Description=node_exporter
After=default.target

[Service]
User=root
ExecStart=`realpath .`/node_exporter_bin/node_exporter

[Install]
WantedBy=default.target
EOM

cp -i ./node_exporter.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable node_exporter.service
systemctl start node_exporter.service

rm -f ./node_exporter.service ./add_node_exporter_service.sh

echo "node exporter `systemctl is-active node_exporter.service`"
