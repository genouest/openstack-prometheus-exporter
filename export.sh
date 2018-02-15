#!/bin/bash

cd /root/openstack-utils/prometheus_exporter
. /root/openstack-utils/prometheus_exporter/venv/bin/activate
. credentials.env
python prometheus-openstack-exporter prometheus-openstack-exporter.yaml &> /var/log/openstack-prometheus-exporter.log


