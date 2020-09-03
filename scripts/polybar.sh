
#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload top -c ~/.dotfiles/config/polybar/bspwm-bar &
done

echo "Bars launched..."