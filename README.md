# Prometheus OpenStack exporter

Exposes high level [OpenStack](http://www.openstack.org/) metrics to [Prometheus](https://prometheus.io/).

Updated from original code https://github.com/CanonicalLtd/prometheus-openstack-exporter


# Deployment

## Requirements


```
pip install prometheus_client requests netaddr PyYAML
```

Must be installed on host with rabbitmqctl to query rabbitmq queue control

# Configuration

Configuration options are documented in prometheus-openstack-exporter.yaml shipped with this project

# FAQ

## Why are openstack_allocation_ratio values hardcoded?

There is no way to retrieve them using OpenStack API.

Alternative approach could be to hardcode those values in queries but this approach breaks when allocation ratios change.

## Why hardcode swift host list?

Same as above, there is no way to retrieve swift hosts using API.

## Why not write dedicated swift exporter?

Swift stats are included mainly because they are trivial to retrieve. If and when standalone swift exporter appears we can revisit this approach

## Why cache data?

We are aware that Prometheus best practise is to avoid caching. Unfortunately queries we need to run are very heavy and in bigger clouds can take minutes to execute. This is problematic not only because of delays but also because multiple servers scraping the exporter could have negative impact on the cloud performance

