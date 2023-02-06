#!/bin/bash

AUTOMATION_USER=$1@pam

# See if the user exists
EXISTS=pveum user list | egrep ${AUTOMATION_USER}
if [ -n "${EXISTS}" ]; then
    echo "${AUTOMATION_USER} exists"
    exit 0
fi

# Create a PVE User for Automation
pveum user add ${AUTOMATION_USER}
pveum aclmod / -user ${AUTOMATION_USER} -role PVEAdmin