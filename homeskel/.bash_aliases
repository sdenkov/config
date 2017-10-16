alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias l='ls -lh --group-directories-first'
alias ll='ls -lAh --group-directories-first'
alias lsd='ls --color -l | grep --color=never "^d"'

alias lstty='find /dev -name "ttyACM*" -o -name "ttyAMA*" -o -name "ttyUSB*"'

alias pwd='pwd -P'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'

alias cal='cal -m'
alias bc='bc -l'
alias feh='feh --scale-down --auto-zoom'
alias ipa='ip a | grep '\''^[0-9]\|inet \([0-9]\+.\)\{3\}[0-9]\+'\'

alias ffprobe='ffprobe -hide_banner'
alias ffplay='ffplay -hide_banner'
alias ffmpeg='ffmpeg -hide_banner'

alias gitlog='git log --oneline --decorate'

alias myfind='find 2>/dev/null . -iname'
alias myfindall='find 2>/dev/null / -iname'

alias tree='tree -a --dirsfirst -I ".git"'
alias treef='tree -if'

alias devbus='qdbus --bus "unix:path=/run/dev-dbus.socket" com.robotev.bus'
alias rpimount='mount -o loop,offset=$((206848*512))'
