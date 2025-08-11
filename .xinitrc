xrdb $HOME/.config/XResources

# switch capslock with escape key
setxkbmap -option caps:escape
xset r rate 200 30
xinput set-prop 13 327 1
# xinput set-prop 12 321 1
# xinput set-prop 11 313 1

feh --bg-fill $HOME/.local/share/bg

xset +dpms
xset dpms 0 0 300

xidlehook \
  --not-when-fullscreen \
  --timer 300 'betterlockscreen -l' '' \
  --timer 120 'xset dpms force off' 'xset dpms force on' &

sxhkd &
slstatus &
picom &
launch_dunst &
clipcatd &

exec dwm
