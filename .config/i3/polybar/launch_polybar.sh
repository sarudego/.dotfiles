for m in $(polybar --list-monitors | cut -d":" -f1); do
  MONITOR=$m polybar --reload example> /dev/null 2> ~/.config/polybar/example-$m.log &
done
