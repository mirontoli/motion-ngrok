#!/usr/bin/env bash

apt install motion -y
mkdir /var/log/motion
chown motion:motion /var/log/motion
systemctl enable motion
systemctl start motion
