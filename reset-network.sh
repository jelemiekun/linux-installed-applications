#!/bin/bash

sudo -v || exit 1

status() {
    echo
    echo "========================================"
    echo "$1"
    echo "========================================"
}

status "Taking enp1s0 DOWN"
sudo ip link set enp1s0 down
echo "Status: $?"

sleep 2

status "Bringing enp1s0 UP"
sudo ip link set enp1s0 up
echo "Status: $?"

sleep 2

for i in {1..5}; do
    status "Restarting NetworkManager ($i/5)"

    if sudo systemctl restart NetworkManager; then
        echo "Status: SUCCESS"
    else
        echo "Status: FAILED"
    fi

    sleep 2
done

status "Network reset complete"

exit 0
