if [ "$(bspc query -N -n focused.floating)" ]; then \
    bspc node -f last.tiled.local; \
else \
    bspc node -f last.floating.local; \
fi
