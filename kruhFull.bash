#!/bin/bash

read -p "Zadej poloměr kruhu: " r

if [[ $r -lt 0 ]]; then
  echo "Číslo nemúže být menší než nula zlato :("
  exit 1
fi

d=$((r * 2))
offset_radius=$(echo "$r - 0.5" | bc -l)

for ((i = 0; i < d; i++)); do
  for ((j = 0; j < d; j++)); do
    x_sqrt=$(echo "($i - $offset_radius)^2" | bc -l)
    y_sqrt=$(echo "($j - $offset_radius)^2" | bc -l)

    if (( $(echo "$x_sqrt + $y_sqrt <= $r * $r + 1" | bc -l) )); then
      echo -n "X "
    else
      echo -n "  "
    fi
  done
  echo
done

