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

    read -p "Do you want to update now? [Y/n] " do_update
    do_update=${do_update:-"Y"}

    if [[ "$do_update" == "Y" || "$do_update" == "Yes" || "$do_update" == "yes" ]]; then
      echo "Starting update..."
      if sudo pacman -Syu && yay; then
          echo "$LOG_LINE" >> "$LOG_FILE"
          echo "Update complete. Logged $LOG_LINE to $LOG_FILE."
          exit 0
      else
          echo "Update failed. Not logging date so it will retry next run."
          exit 1
      fi
    else
      echo "Update aborted by user. Not logging date so it will retry next run."
      exit 0
    fi
fi

exit 0
