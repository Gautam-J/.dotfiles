#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(fd -td -a . ~/Coding ~/SecondBrain --min-depth=1 --max-depth=3 | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

suffix="/"
selected=${selected/%$suffix}
selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

echo "Selected name: ${selected_name}"
echo "tmux running: ${tmux_running}"
echo "selected: ${selected}"

if [ ! $tmux_running ]; then
    echo "Starting TMUX server, creating new session..."
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if [ -z "$TMUX" ]; then
    echo "TMUX server running, connecting to session..."
    # create a new session, if already available attach to it
    tmux new-session -A -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    echo "In tmux session, creating new session..."
    tmux new-session -ds $selected_name -c $selected
fi

echo "Switching to session..."
tmux switch-client -t $selected_name
