#!/bin/sh

MIN_LENGTH=16
MAX_LENGTH=24

LENGTH=$(shuf -i $MIN_LENGTH-$MAX_LENGTH -n 1)

PASSWORD=$(tr -dc 'A-Za-z0-9!@#$%^&*()_+' < /dev/urandom | head -c $LENGTH)

# echo "$PASSWORD"
echo "$PASSWORD" | xclip -selection clipboard
