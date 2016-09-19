autocutsel -buttonup -fork &

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap -layout us,bg -variant ,phonetic -option grp:alt_shift_toggle
[[ -f ~/.fehbg ]] && ~/.fehbg
exec wmii
