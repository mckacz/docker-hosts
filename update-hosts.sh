#!/bin/sh

if [ ! -e /tmp/hosts ]; then
    touch /tmp/hosts
fi

sed '/# <docker-hosts>/,/# <\/docker-hosts>\n/d' /etc/hosts > /tmp/hosts.new
cat /tmp/hosts >> /tmp/hosts.new
cat /tmp/hosts.new > /etc/hosts
