#! /bin/sh

type=$(yabai -m query --spaces --space | jq .type)

if [ $type = '"bsp"' ]
then
    type=float
else
    type=bsp
fi

yabai -m space --layout $type
