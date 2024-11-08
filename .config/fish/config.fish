if status is-interactive
    # Commands to run in interactive sessions can go here
    echo -e "\033[35mWelcome back, \033[35mCommander!"
end

set -g fish_greeting
# set -g fish_key_bindings fish_vi_key_bindings

starship init fish | source

export EDITOR=nvim
export QT_QPA_PLATFORMTHEME=qt5ct

# goland
export GOPATH=$HOME/.local/state/go
export HADOOP_HOME=/home/gentle/projects/homeworks/distribute_system/hadoop-2.10.1
export HADOOP_CONF_DIR=/home/gentle/projects/homeworks/distribute_system/hadoop-2.10.1/etc/hadoop

# clipmenu
export CM_LAUNCHER=rofi

# ranger
# avoid laoding twice
export RANGER_LOAD_DEFAULT_RC=FALSE

# anaconda 
# set -Ux CONDA_AUTO_ACTIVATE_BASE true
# set -x PATH /opt/anaconda/condabin $PATH

# export PATH="$PATH:/home/gentle/.local/bin/"

alias hdfs="/home/gentle/projects/homeworks/distribute_system/hadoop-2.10.1/bin/hdfs"
alias change_nvidia="sudo mv /usr/share/vulkan/nvidia_icd.json /usr/share/vulkan/icd.d/ && optimus-manager --switch nvidia"
alias change_integrated="sudo mv /usr/share/vulkan/icd.d/nvidia_icd.json /usr/share/vulkan/ && optimus-manager --switch integrated"

# common
alias l="lsd"
alias ls="lsd"
alias c="clear"
alias v="nvim"
alias j="cd ~/notes && nvim"
# alias r="ranger"

# pacman
alias i="sudo pacman -S"
alias u="sudo pacman -Syyu"
alias f="pacman -Ss"

# git
alias gcpp="git clone git@github.com:GentleCold/cpp_project_template.git"

# deivce

# enable/disable keyboard
alias ek="xinput set-prop \"AT Translated Set 2 keyboard\" \"Device Enabled\" 1"
alias dk="xinput set-prop \"AT Translated Set 2 keyboard\" \"Device Enabled\" 0"

# enable/disable touchpad
alias et="xinput set-prop \"ELAN0662:00 04F3:30BC Touchpad\" \"Device Enabled\" 1"
alias dt="xinput set-prop \"ELAN0662:00 04F3:30BC Touchpad\" \"Device Enabled\" 0"

# conda activate/deactivate
# alias cod="conda deactivate"
# alias coa="conda activate"
alias pyl="ls ~/.python_env/"

# translation
alias tz="trans :zh"
alias te="trans :en"

# tidy downloads
alias td="sh ~/.config/scripts/tidy.sh"

# generate random password
alias gen="sh ~/.config/scripts/gen_password.sh"

# yazi shell wrapper
function r
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# clean trash
# alias ct="rm -r ~/trash/*"

# TokyoNight Color Palette
# set -l foreground c0caf5
# set -l selection 2e3c64
# set -l comment 565f89
# set -l red f7768e
# set -l orange ff9e64
# set -l yellow e0af68
# set -l green 9ece6a
# set -l purple 9d7cd8
# set -l cyan 7dcfff
# set -l pink bb9af7
#
# # Syntax Highlighting Colors
# set -g fish_color_normal $foreground
# set -g fish_color_command $cyan
# set -g fish_color_keyword $pink
# set -g fish_color_quote $yellow
# set -g fish_color_redirection $foreground
# set -g fish_color_end $orange
# set -g fish_color_error $red
# set -g fish_color_param $purple
# set -g fish_color_comment $comment
# set -g fish_color_selection --background=$selection
# set -g fish_color_search_match --background=$selection
# set -g fish_color_operator $green
# set -g fish_color_escape $pink
# set -g fish_color_autosuggestion $comment
#
# # Completion Pager Colors
# set -g fish_pager_color_progress $comment
# set -g fish_pager_color_prefix $cyan
# set -g fish_pager_color_completion $foreground
# set -g fish_pager_color_description $comment
# set -g fish_pager_color_selected_background --background=$selection
#

# Created by `pipx` on 2024-01-17 17:57:09
set PATH $PATH /home/gentle/.local/bin
