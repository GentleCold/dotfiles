#!/bin/bash
if [ "$(bspc config border_width)" -eq "0" ]; then \
    bspc config border_width 3; \
else \
    bspc config border_width 0; \
fi
