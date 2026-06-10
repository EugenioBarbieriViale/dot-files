#!/usr/bin/bash
sleep_time=${1:-15m}
walls_dir="/home/eu/Pictures/wallpapers"

mapfile -d '' walls < <(find "$walls_dir" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) -print0 | shuf -z)

if [ ${#walls[@]} -eq 0 ]; then
  notify-send "Wallpaper Changer" "No wallpapers found in $walls_dir"
  echo "No wallpapers found in $walls_dir" >&2
  exit 1
fi

for wall in "${walls[@]}"; do
  feh --bg-fill "$wall"
  sleep "$sleep_time"
done
