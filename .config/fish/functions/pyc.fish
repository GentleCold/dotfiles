# create python environment
function pyc
    mkdir ~/.python_env/$argv
    virtualenv ~/.python_env/$argv/
end
