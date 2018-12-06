#!/bin/bash
#author: Yiheng
#description: 动态展示terminal大小
#create: 2018/12/6

function redraw()
{
    local str width height length

    width=$(tput cols)
    height=$(tput lines)
    str="Width = $width Height = $height"
    length=${#str}
    clear
    tput cup $((height / 2)) $((( width / 2) - (length / 2)))
    echo "$str"
}

trap redraw WINCH

redraw
while true; do
    :
done