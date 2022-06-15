#!/usr/bin/env bash
# Terminate already running bar instances
killall -q polybar

# Launch polybar
echo "---" | tee -a /tmp/toppolybar.log
polybar main_bar >> /tmp/toppolybar.log

