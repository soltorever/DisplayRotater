#!/bin/sh

VERTICAL=101
L_HORIZONTAL=102
R_HORIZONTAL=103

TOUCH_SCREEN='DEVICE NAME' 

`xmessage -buttons VERTICAL,L-HORIZONTAL,R-HORIZONTAL -nearmouse 'How to Display'`
MODE=$?


if [ ${MODE} = ${VERTICAL} ];
then
    xinput set-prop "${TOUCH_SCREEN}" 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
    xrandr -o normal
elif [ ${MODE} = ${L_HORIZONTAL} ];
then
    xinput set-prop "${TOUCH_SCREEN}" 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1
    xrandr -o left
elif [ ${MODE} = ${R_HORIZONTAL} ];
then
    xinput set-prop "${TOUCH_SCREEN}" 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
    xrandr -o right
fi
