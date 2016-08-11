#!/bin/sh

# Create haproxy initial configuration
confd -onetime -sync-only -backend rancher -prefix /2015-12-19

# Launch haproxy
/usr/local/sbin/haproxy-systemd-wrapper -p /run/haproxy.pid -f /usr/local/etc/haproxy/haproxy.cfg &

# Launch confd
exec confd -interval 3 -backend rancher -prefix /2015-12-19
