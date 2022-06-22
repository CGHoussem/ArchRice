#!/bin/sh

getDefaultSink() {
    defaultSink=$(pactl get-default-sink) 
    description=$(pactl list sinks | sed -n "/${defaultSink}/,/Description/p; /Description/q" | sed -n 's/^.*Description: \(.*\)$/\1/p')
    echo "${description}"
}

getDefaultSource() {
    defaultSource=$(pactl get-default-source)
    description=$(pactl list sources | sed -n "/${defaultSource}/,/Description/p;" | sed -n 's/^.*Description: \(.*\)$/\1/p')
    echo "${description}"
}

VOLUME=$(pamixer --get-volume-human)
SINK=$(getDefaultSink)
SOURCE=$(getDefaultSource)

case $1 in
    "--up")
        pamixer --increase 10
        ;;
    "--down")
        pamixer --decrease 10
        ;;
    "--mute")
        pamixer --toggle-mute
        ;;
    *)

    #echo "${SOURCE} | ${VOLUME} ${SINK}"

    if [ ${VOLUME} = 'muted' ]; then
	echo ""
    else
	echo "${VOLUME} "
    fi

esac


