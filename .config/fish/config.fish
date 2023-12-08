if status is-interactive
    # Commands to run in interactive sessions can go here
end

export EDITOR=nvim
export QT_QPA_PLATFORMTHEME=qt5ct

# clipmenu
export CM_LAUNCHER=rofi

# ranger
# avoid laoding twice
export RANGER_LOAD_DEFAULT_RC=FALSE

# anaconda 
# set -Ux CONDA_AUTO_ACTIVATE_BASE true
# set -x PATH /opt/anaconda/condabin $PATH

# common
alias v="nvim"
alias r="ranger"
alias j="cd ~/notes && nvim"

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
alias td="sh ~/.config/tidy.sh"
