#! /bin/fish

source ~/.scripts/brightness_control/value.sh

set amount ( math $value - $argv[1] )
set min_value 0.5

if [ $min_value -lt $value ]
   xrandr --output LVDS-1 --brightness $amount
   echo "set value $amount" > ~/.scripts/brightness_control/value.sh
end
