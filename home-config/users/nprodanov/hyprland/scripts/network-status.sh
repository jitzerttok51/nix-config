#!/bin/sh

# This script displays the current network status, including Wi-Fi SSID,
# signal strength, or Ethernet IP address.
# It prioritizes 'nmcli' for detailed information and falls back to
# 'ip' and 'iwgetid' if 'nmcli' is not found.
#
# For the icons to display correctly, you need to have a font that supports
# Font Awesome 6 (e.g., a Nerd Font) installed and configured in your terminal.

# Define icons
ICON_WIFI=""       # Font Awesome 6: fa-wifi
ICON_ETHERNET=""   # Font Awesome 6: fa-ethernet
ICON_DISCONNECTED="⚠" # Warning sign
ICON_UNKNOWN=""    # Font Awesome 6: fa-network-wired (generic network icon)

# --- Function to get network status using nmcli ---
get_status_nmcli() {
    # Check if nmcli is available
    if ! command -v nmcli >/dev/null 2>&1; then
        return 1 # nmcli not found
    fi

    # Get the primary active device and its type
    # 'nmcli -t -f DEVICE,TYPE,STATE dev status' lists all devices and their states
    # We'll take the first one that is 'connected'
    ACTIVE_DEV_LINE=$(nmcli -t -f DEVICE,TYPE,STATE dev status | grep ':connected$' | head -n 1)

    if [ -z "$ACTIVE_DEV_LINE" ]; then
        echo "Disconnected ${ICON_DISCONNECTED}"
        return 0
    fi

    # Extract device name and type
    DEVICE_NAME=$(echo "$ACTIVE_DEV_LINE" | cut -d':' -f1)
    DEVICE_TYPE=$(echo "$ACTIVE_DEV_LINE" | cut -d':' -f2)

    IP_ADDRESS=""
    SIGNAL_STRENGTH=""
    SSID=""

    # Get detailed properties for this specific active device
    # Using 'nmcli -t dev show "$DEVICE_NAME"' to get terse output
    DEV_DETAILS=$(nmcli -t dev show "$DEVICE_NAME")

    case "$DEVICE_TYPE" in
        "ethernet")
            # IP address for Ethernet devices
            # Look for "IP4.ADDRESS[1]:" line and extract the IP
            IP_ADDRESS=$(echo "$DEV_DETAILS" | grep -oP 'IP4.ADDRESS\[1\]:\s*\K[\d.]+' | cut -d'/' -f1 | head -n 1)
            if [ -n "$IP_ADDRESS" ]; then
                echo "${IP_ADDRESS} ${ICON_ETHERNET}"
            else
                echo "Ethernet (No IP) ${ICON_ETHERNET}"
            fi
            ;;
        "wifi")
            # SSID and signal strength for Wi-Fi devices
            # Get the active connection name linked to this Wi-Fi device
            CONN_NAME=$(echo "$DEV_DETAILS" | grep -oP 'GENERAL.CONNECTION:\s*\K.*' | head -n 1)
            if [ -n "$CONN_NAME" ]; then
                # Now query the connection for SSID and signal
                # Using 'nmcli -t connection show "$CONN_NAME"' to get terse output
                CONN_INFO=$(nmcli -t connection show "$CONN_NAME")
                SSID=$(echo "$CONN_INFO" | grep -oP 'WIFI-PROPERTIES.SSID:\s*\K.*' | head -n 1)
                SIGNAL_STRENGTH=$(echo "$CONN_INFO" | grep -oP 'WIFI-PROPERTIES.SIGNAL:\s*\K\d+' | head -n 1)

                if [ -n "$SSID" ] && [ -n "$SIGNAL_STRENGTH" ]; then
                    echo "${SSID} (${SIGNAL_STRENGTH}%) ${ICON_WIFI}"
                elif [ -n "$SSID" ]; then
                    echo "${SSID} ${ICON_WIFI}"
                else
                    echo "Wi-Fi (Connected) ${ICON_WIFI}"
                fi
            else
                echo "Wi-Fi (Connected) ${ICON_WIFI}" # Fallback if connection name not found
            fi
            ;;
        *)
            echo "Connected (Unknown Type) ${ICON_UNKNOWN}"
            ;;
    esac

    return 0
}

# --- Function to get network status using ip and iwgetid (fallback) ---
get_status_fallback() {
    # Check for active Wi-Fi connection
    if command -v iwgetid >/dev/null 2>&1; then
        SSID=$(iwgetid -r 2>/dev/null)
        if [ -n "$SSID" ]; then
            # Attempt to get signal strength (less reliable without specific tools)
            # This is a very basic attempt and might not work on all systems
            SIGNAL=""
            if command -v grep >/dev/null 2>&1 && command -v awk >/dev/null 2>&1; then
                SIGNAL_RAW=$(grep "$SSID" /proc/net/wireless 2>/dev/null | awk '{print $3}')
                if [ -n "$SIGNAL_RAW" ]; then
                    # Convert signal strength (often -dBm) to percentage (approximation)
                    # This conversion is highly approximate and may not be accurate
                    SIGNAL_PERCENT=$(( (SIGNAL_RAW + 100) * 100 / 70 )) # Assuming -30dBm is 100%, -100dBm is 0%
                    if [ "$SIGNAL_PERCENT" -gt 100 ]; then SIGNAL_PERCENT=100; fi
                    if [ "$SIGNAL_PERCENT" -lt 0 ]; then SIGNAL_PERCENT=0; fi
                    SIGNAL=" (${SIGNAL_PERCENT}%)"
                fi
            fi
            echo "${SSID}${SIGNAL} ${ICON_WIFI}"
            return 0
        fi
    fi

    # Check for active Ethernet connection (any interface with an IP address, excluding loopback)
    if command -v ip >/dev/null 2>&1; then
        IP_ADDRESS=$(ip -4 addr show scope global | grep -oP 'inet \K[\d.]+' | head -n 1)
        if [ -n "$IP_ADDRESS" ]; then
            echo "${IP_ADDRESS} ${ICON_ETHERNET}"
            return 0
        fi
    fi

    echo "Disconnected ${ICON_DISCONNECTED}"
    return 0
}

# --- Main logic ---
# Try nmcli first, then fallback
if get_status_nmcli; then
    # nmcli handled the output, nothing more to do
    :
else
    # nmcli not found or failed, use fallback
    get_status_fallback
fi
