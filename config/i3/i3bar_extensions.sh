#!/usr/bin/bash
# playerctl and jq should be installed. python3 is also needed.

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

  echo "{ \"name\": \"media\", \"markup\": \"none\", \"full_text\": \"$media\", \"color\": \"$color\" }"
}

function format_brightness {
  local br=$(cat /sys/class/backlight/intel_backlight/brightness)
  local scaled_br=$(python3 -c "print(round($br / 1515.0 * 100.0))")
  echo "{ \"name\": \"brightness\", \"markup\": \"none\", \"full_text\": \"BRI: $scaled_br%\" }"
}


read line; echo "$line"
read line; echo "$line"
read line; echo "$line"

json_array="[]"

while :
do
  json_media=$(format_media)
  json_brightness=$(format_brightness)

  read line
  json_array="$(echo $line | sed -e 's/^,//')"
  json_array=$(add_to_bar "$json_media")
  json_array=$(add_by_holder "brightness_holder" "$json_brightness")
  echo ",$json_array"
done
