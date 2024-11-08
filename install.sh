#!/bin/bash

# soft link
# remind to change this
dotfiles="$HOME/projects/dotfiles/dotfiles/.config"

configs=(
    alacritty
    bspwm
    dunst
    fish
    fontconfig
    lazygit
    nvim
    picom
    polybar
    ranger
    rofi
    sxhkd
    scripts 
    tmux
    yazi
)

for file in "${configs[@]}"; do
    target="$HOME/.config/$file"

    if [ -e "$target" ]; then
        if [ -L "$target" ]; then
            echo "$target is already a symbolic link. Skipping..."
	    continue
        else
            echo "Backing up $target"
            mv "$target" "$target.bak"
        fi
    fi

    echo "Creating symlink for $file"
    ln -s "$dotfiles/$file" "$target"
done

echo "Dotfiles installation complete!"
