#! /bin/fish

source ~/.scripts/brightness_control/value.sh

set amount ( math $value + $argv[1] )
set max_value 1.3

if [ $max_value -gt $value ]
   xrandr --output LVDS-1 --brightness $amount
   echo "set value $amount" > ~/.scripts/brightness_control/value.sh
end
