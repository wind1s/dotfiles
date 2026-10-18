#!/bin/bash
# Set MTU to optimal size for protonvpn
# Place in /etc/NetworkManager/dispatcher.d/99-protonvpn-mtu.sh if using NetworkManager to automate the MTU setting.                                   

INTERFACE=$1
ACTION=$2

if [ "$ACTION" = "up" ]; then
    # Give the app a split second to finish binding the leak protection
    sleep 1

    if [ "$INTERFACE" = "proton0" ]; then
        # WireGuard Protocol Optimized Settings
        ip link set dev proton0 mtu 1420
        ip link set dev ipv6leakintrf0 mtu 1420

    elif [ "$INTERFACE" = "tun0" ]; then
        # OpenVPN Protocol Optimized Settings
        ip link set dev tun0 mtu 1400
        ip link set dev ipv6leakintrf0 mtu 1400
    fi
fi
