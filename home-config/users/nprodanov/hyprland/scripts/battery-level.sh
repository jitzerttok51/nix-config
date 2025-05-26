#!/bin/sh

# This script displays the current battery level and status.
# It reads information from the /sys/class/power_supply/ directory.
#
# For the icons to display correctly, you need to have a font that supports
# Font Awesome 6 (e.g., a Nerd Font) installed and configured in your terminal.

# Define the default battery path.
# You might need to adjust this if your primary battery is not BAT0
# (e.g., BAT1, BATC) on your system.
BATTERY_PATH="/sys/class/power_supply/BAT0"

# --- Auto-detect battery path if BAT0 doesn't exist ---
# This loop tries to find any directory starting with "BAT" in /sys/class/power_supply/
# and uses the first one it finds.
if [ ! -d "$BATTERY_PATH" ]; then
    FOUND_BATTERY=0
    for bat_dir in /sys/class/power_supply/BAT*; do
        if [ -d "$bat_dir" ]; then
            BATTERY_PATH="$bat_dir"
            # Uncomment the line below for debugging to see which battery path is used
            # echo "Auto-detected battery at: $BATTERY_PATH" >&2
            FOUND_BATTERY=1
            break
        fi
    done

    # If no battery directory was found, exit with an error.
    if [ "$FOUND_BATTERY" -eq 0 ]; then
        echo "Error: No battery found in /sys/class/power_supply/. Please check your system." >&2
        exit 1
    fi
fi

# --- Read battery capacity ---
# The 'capacity' file contains the battery charge percentage (0-100).
CAPACITY=$(cat "$BATTERY_PATH/capacity" 2>/dev/null)
if [ -z "$CAPACITY" ]; then
    echo "Error: Could not read battery capacity from $BATTERY_PATH/capacity." >&2
    exit 1
fi

# --- Read battery status ---
# The 'status' file typically contains "Charging", "Discharging", or "Full".
STATUS=$(cat "$BATTERY_PATH/status" 2>/dev/null)
if [ -z "$STATUS" ]; then
    echo "Error: Could not read battery status from $BATTERY_PATH/status." >&2
    exit 1
fi

# --- Determine the appropriate icon based on status and capacity ---
ICON=""
case "$STATUS" in
    "Charging")
        ICON="" # Font Awesome 6: fa-bolt (charging icon)
        ;;
    "Discharging")
        # Select battery icon based on charge level
        if [ "$CAPACITY" -le 10 ]; then
            ICON="" # fa-battery-empty (0-25%)
        elif [ "$CAPACITY" -le 30 ]; then
            ICON="" # fa-battery-quarter (25-50%)
        elif [ "$CAPACITY" -le 60 ]; then
            ICON="" # fa-battery-half (50-75%)
        elif [ "$CAPACITY" -le 90 ]; then
            ICON="" # fa-battery-three-quarters (75-95%)
        else
            ICON="" # fa-battery-full (95-100%)
        fi
        ;;
    "Full")
        ICON="" # fa-battery-full (full battery, often implies plugged in)
        ;;
    *)
        # Handle "Unknown" or "Not charging" status.
        # Try to check if AC adapter is online.
        if [ -f "/sys/class/power_supply/AC/online" ] && [ "$(cat /sys/class/power_supply/AC/online)" -eq 1 ]; then
            ICON="" # fa-plug (plugged in, but not necessarily charging)
        else
            ICON="" # fa-battery-slash (generic battery icon for truly unknown/unplugged)
        fi
        ;;
esac

# --- Output the final battery status ---
echo "${CAPACITY}% ${ICON}"

# Optional: Uncomment the lines below for more detailed output (e.g., for debugging)
# echo "Raw Capacity: $CAPACITY" >&2
# echo "Raw Status: $STATUS" >&2
# echo "Battery Path Used: $BATTERY_PATH" >&2
