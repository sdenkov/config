if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap -layout us,bg -variant ,phonetic -option grp:alt_shift_toggle
[[ -f ~/.fehbg ]] && ~/.fehbg
exec i3
