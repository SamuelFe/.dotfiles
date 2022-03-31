#!/bin/bash

## The new name of the window is the first argument passed to the script:
new_name="${1}"

## application is all arguments but the first (the title)
application=${@:2}

## Run the app in background and in quiet mode:
$application &> /dev/null &

## Get the pid of the app:
app_pid=$!

## Wait until the window appears:
until xdotool search --onlyvisible --pid $app_pid &> /dev/null; do sleep 0.01; done

## Change the window name:
xdotool \
         search \
                --onlyvisible \
                --pid $app_pid \
                --name "\a\b\c" \
         set_window \
                --class "$new_name" \
                --name "$new_name"

## Comment this line to run the app in background:
# wait $app_pid
