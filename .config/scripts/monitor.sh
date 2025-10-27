#!/bin/sh

edp=$(xrandr | grep -E 'eDP' | awk '{print $1}')
hdmi=$(xrandr | grep -E 'HDMI' | awk '{print $1}')

if [ "$1" = "disconnect" ]; then
  xrandr --output $edp --auto --primary --output $hdmi --off
  bspc wm -O $edp
  bspc monitor $edp -d I II III IV V VI
  sed -i 's/\(size = \s*\)[0-9]\+/\19/' ~/.config/alacritty/alacritty.toml
else
  if xrandr | grep "HDMI" | grep " connected"; then
    xrandr --output $hdmi --mode 1920x1080 --rate 144 --primary --set "Broadcast RGB" "Full" \
      --output $edp --auto --left-of $hdmi
    bspc wm -O $hdmi
    bspc monitor $hdmi -d I II III IV V VI
    bspc monitor $edp -d VII
    sed -i 's/\(size = \s*\)[0-9]\+/\112/' ~/.config/alacritty/alacritty.toml
  else
    echo "HDMI not connected"
  fi
fi

sh ~/.config/polybar/launch.sh
feh --bg-fill $HOME/downloads/wallpaper/2.png
