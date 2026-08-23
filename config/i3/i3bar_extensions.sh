#!/usr/bin/bash
# playerctl, bluetoothctl, jq, python3 are required

function add_to_bar {
  local replacement="$1"
  echo "$json_array" | jq --argjson arg_j "$replacement" '[$arg_j] + .'
}

function add_by_holder {
  local instance="$1"
  local replacement="$2"
  echo "$json_array" | jq --argjson arg_j "$replacement" "(.[] | (select(.instance==\"$instance\"))) |= \$arg_j" 
}

function get_active_player {
  for player in $(/usr/bin/playerctl -l); do
    if [ "$(/usr/bin/playerctl -p "$player" status)" = "Playing" ]; then
      echo "$player"
      break
    fi
  done
}

function format_media {
  local player=$(get_active_player)

  if [[ -n $player ]]; then
    local _status="$(/usr/bin/playerctl -p "$player" status)"
    local title="$(/usr/bin/playerctl -p "$player"  metadata title)"
    local artist="$(/usr/bin/playerctl -p "$player"  metadata artist)"
  else
    local _status="$(/usr/bin/playerctl status)"
    local title="$(/usr/bin/playerctl metadata title)"
    local artist="$(/usr/bin/playerctl metadata artist)"
  fi

  if [[ $_status == "Playing" ]]; then
    local symbol="▶"
    color="#FFFFFF"
  elif [[ $_status == "Paused" ]]; then
    local symbol="⏸︎"
    color="#808080"
  else
    local symbol=""
    color="#000000"
    echo "{ \"name\": \"media\", \"markup\": \"none\", \"full_text\": \"\" }"
    return
  fi

  if [[ -n "$artist" ]]; then
    local media="$symbol $title, $artist"
  else
    local media="$symbol $title"
  fi

  local trim_media=$(echo "$media" | tr \"\' ' ') # replace quotes with a space
  echo "{ \"name\": \"media\", \"markup\": \"none\", \"full_text\": \"$trim_media\", \"color\": \"$color\" }"
}

function format_brightness {
  local br=$(cat /sys/class/backlight/intel_backlight/brightness)
  local scaled_br=$(python3 -c "print(round($br / 1515.0 * 100.0))")
  echo "{ \"name\": \"brightness\", \"markup\": \"none\", \"full_text\": \"BRI: $scaled_br%\" }"
}

function get_bluetooth_info {
  local ref_line=$(echo "$1")
  local next_line_count=$2
  local ref_line_passed=0

  for line in $(/usr/sbin/bluetoothctl info); do
    if [ "$ref_line_passed" = "1" ]; then
      ((next_line_count+=1))
    fi

    if [ "$next_line_count" = "1" ]; then
      echo "$line"
      ref_line_passed=0
      next_line_count=0
    fi

    if [ "$line" = "$ref_line" ]; then
      ((ref_line_passed+=1))
    fi
  done
}

function format_bluetooth {
  local dev_name=$(get_bluetooth_info "Name:" 0)
  local string_bat=$(get_bluetooth_info "Percentage:" -1)
  local bat_par="${string_bat#?}"
  local bat="${bat_par%?}"

  if [[ -n "$dev_name" ]]; then
    local display_string="BLUE: $dev_name, $bat%"
  else
    local display_string=""
  fi
  echo "{ \"name\": \"bluetoothctl\", \"markup\": \"none\", \"full_text\": \"$display_string\" }"
}

function show_tailscale_status {
  local tails_status=""
  local color="#FF0000"
  if command -v /usr/sbin/tailscale &> /dev/null; then
      if /usr/sbin/tailscale status &> /dev/null; then
          tails_status="TAILS: yes"
          color="#00FF00"
      else
          tails_status="TAILS: no"
      fi
  else
      tails_status="TAILS: no"
  fi
  echo "{ \"name\": \"tailscale\", \"markup\": \"none\", \"full_text\": \"$tails_status\", \"color\": \"$color\" }"
}


read line; echo "$line"
read line; echo "$line"
read line; echo "$line"

json_array="[]"

while :
do
  json_media=$(format_media)
  json_brightness=$(format_brightness)
  json_bluetooth=$(format_bluetooth)
  json_tailscale=$(show_tailscale_status)

  read line
  json_array="$(echo $line | sed -e 's/^,//')"
  json_array=$(add_to_bar "$json_tailscale")
  json_array=$(add_to_bar "$json_bluetooth")
  json_array=$(add_to_bar "$json_media")
  json_array=$(add_by_holder "brightness_holder" "$json_brightness")
  echo ",$json_array"
done
