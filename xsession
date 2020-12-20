export LANG=en_US.UTF-8

sxhkd &

/home/brian/.fehbg &

unclutter &

compton -bcCG -o 0.3 -r 4 -l 2 -t 2 --no-fading-openclose
xrdb -merge /home/brian/.Xresources

bspwm
