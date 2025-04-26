#!/bin/bash
if [ ! -d "/home/${USER}/data" ]; then
        mkdir -p /home/${USER}/data
        mkdir -p /home/${USER}/data/mariadb
        mkdir -p /home/${USER}/data/wordpress
        chmod -R 777 /home/${USER}/data
fi
