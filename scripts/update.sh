#!/usr/sbin/bash

DAY="$(date +%a)"
UPDATE_DAY="Sun"
LOG_FILE="/home/eu/.arch_update.log"
LOG_LINE="$(date +%D)"

if [[ "$DAY" == "$UPDATE_DAY" ]]; then
    touch "$LOG_FILE"

    if [[ "$(tail -1 "$LOG_FILE")" == "$LOG_LINE" ]]; then
        exit 0
    fi

    echo "Starting update..."
    if sudo pacman -Syu && yay; then
        echo "$LOG_LINE" >> "$LOG_FILE"
        echo "Update complete. Logged $LOG_LINE to $LOG_FILE."
        exit 0
    else
        echo "Update failed. Not logging date so it will retry next run."
        exit 1
    fi
fi
