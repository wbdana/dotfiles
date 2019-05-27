#!/bin/sh
# If you don't have the script's cwd set, you get XML errors

# export WINEPREFIX=$HOME/.wine/
# cd ~/.wine/drive_c/Program\ Files/Sony/EverQuest

# Bind to one core of the processor and launch.
# The client will spew a lot of errors, especially every time
# you target a mob, hence the stdout/stderr redirect.
# You Probably want to leave off the 2>/dev/null until you're satisifed
# everything is working.

# taskset -c 0 padsp wine eqgame.exe patchme
# wine eqgame.exe patchme
# 2>/dev/null
env WINEPREFIX="/home/wbdana/.wine" wine C:\\Program \Files\\Sony\\EverQuest\\eqgame patchme
# Append line above when finished debugging
