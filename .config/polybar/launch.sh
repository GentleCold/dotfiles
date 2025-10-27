#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
if xrandr | grep "HDMI" | grep " connected"; then
  polybar hdmi 2>&1 | tee -a /tmp/polybar.log &
  polybar edp 2>&1 | tee -a /tmp/polybar.log &
  disown
else
  polybar mybar 2>&1 | tee -a /tmp/polybar.log &
  disown
fi

echo "Polybar launched..."
