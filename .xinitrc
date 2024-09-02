xrdb $HOME/.config/XResources

# switch capslock with escape key
setxkbmap -option caps:escape
xset r rate 200 30
xinput set-prop 13 327 1
# xinput set-prop 12 321 1
# xinput set-prop 11 313 1

#set brightness to default (50
# sudo light -I

# feh --bg-fill $HOME/.local/share/bg
feh --bg-fill $HOME/Pictures/wallpapers/wallpaper.jpg

sxhkd &
slstatus &
picom &
launch_dunst &

#start emacs daemon
# emacs --bg-daemon 
# doom-change-theme

# syncthing --no-browser &

exec dwm
# while :; do
# 	ssh-agent dwm
# done
