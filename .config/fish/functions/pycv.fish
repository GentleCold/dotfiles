# create python environment
function pycv
    mkdir ~/.python_env/$argv[2]
    virtualenv -p $argv[1] ~/.python_env/$argv[2]/
end
