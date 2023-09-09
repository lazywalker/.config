#! /bin/sh

type=$(yabai -m query --spaces --space | jq .type)

if [ $type = '"bsp"' ]
then
    type=float
else
    type=bsp
fi

/usr/bin/env osascript <<< \
        "display notification \"Switching to $type space.\" with title \"Skhd\""; \

yabai -m space --layout $type
