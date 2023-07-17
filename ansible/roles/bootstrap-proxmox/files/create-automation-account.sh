#!/bin/bash

AUTOMATION_USER=$1@pam

# See if the user exists
EXISTS=/usr/sbin/pveum user list | egrep ${AUTOMATION_USER}
if [ -n "${EXISTS}" ]; then
    echo "${AUTOMATION_USER} exists"
    exit 0
fi

# Create a PVE User for Automation
/usr/sbin/pveum user add ${AUTOMATION_USER}
/usr/sbin/pveum aclmod / -user ${AUTOMATION_USER} -role PVEAdmin