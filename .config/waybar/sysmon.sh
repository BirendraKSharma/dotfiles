#!/bin/bash

# First snapshot
snapshot1=$(awk '/^cpu /{print $2+$3+$4+$5, $5}' /proc/stat)
total1=$(echo $snapshot1 | cut -d' ' -f1)
idle1=$(echo $snapshot1 | cut -d' ' -f2)

sleep 0.5

# Second snapshot
snapshot2=$(awk '/^cpu /{print $2+$3+$4+$5, $5}' /proc/stat)
total2=$(echo $snapshot2 | cut -d' ' -f1)
idle2=$(echo $snapshot2 | cut -d' ' -f2)

diff_total=$(( total2 - total1 ))
diff_idle=$(( idle2 - idle1 ))
used_cpu=$(( (diff_total - diff_idle) * 100 / diff_total ))

awk -v cpu="$used_cpu" '
  /^MemTotal/    { t=$2 }
  /^MemAvailable/{ a=$2 }
  /^SwapTotal/   { st=$2 }
  /^SwapFree/    { sf=$2 }
  END {
    used  = (t - a)  / 1024 / 1024
    total = t        / 1024 / 1024
    swap  = (st - sf)/ 1024 / 1024
    printf "󰓅 %d%%  󰍛 %.1f/%.1fG  󰾴 %.1fG  \n", cpu, used, total, swap
  }
' /proc/meminfo
