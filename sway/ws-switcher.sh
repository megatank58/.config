#!/run/current-system/sw/bin/bash
swaymsg workspace "$1"
ws_id="$( swaymsg -t get_workspaces | jq '.[] | select(.focused==true) | .id' )"
n_windows="$( swaymsg -t get_tree | jq --arg ws_id $ws_id '.nodes | .[] | .nodes | .[] | select(.id==($ws_id|tonumber)) | .nodes | length' )"

if [ "$n_windows" -eq 0 ]; then
  pkill waybar
  waybar &
else
  pkill waybar
fi
