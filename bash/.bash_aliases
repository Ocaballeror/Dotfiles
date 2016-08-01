# and them some ls aliases
alias s='ls -CF'
alias l='ls -CF'
alias lsw='ls'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -lhA'

# always get colorized grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# and assume we got permission to reboot without password
alias reboot='sudo reboot now'
alias shutdown='sudo shutdown now'
alias poweroff='sudo poweroff now'

# and some custom aliases too
alias ,,='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias 3.='.3'
alias 4.='.4'
alias 5.='.5'
alias aliases='$EDITOR ~/.bash_aliases'
alias ax='chmod a+x'
alias android='/usr/share/android-studio/bin/studio.sh > /dev/null 2> /dev/null &'
alias bat='battery'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'
alias buildjava='rm *.class && javac *.java && java Main'
alias c='cd'
alias cdshared='cd ~/Drive/Apuntes/IA/Practicas/IA/'
alias checkbash='changed=false; for name in .bashrc .bash_aliases .bash_functions; do $(cmp -s ~/$name ~/Shared/$name) || (meld ~/$name ~/Shared/$name && changed=true); done; $changed || echo "Nothing to check"; unset changed;'
alias chrome='google-chrome-stable > /dev/null 2> /dev/null &'
alias cl='fc -e -|pbcopy' # Copy the output of last command to clipboard
alias clean='sudo pacman -Scc && sudo pacman -Rs $(pacman -Qqtd) && rmshit'
alias cls='reset'
alias connection='ping -c 3 www.google.com'
alias cpw7='cpvm Windows7'
alias cpxp='cpvm XP'
alias diff='colordiff'
alias depth='echo $(($(find . | tr -cd "/\n" | sort | tail -1 | wc -c) -1))'
alias eclipse='/opt/eclipse/eclipse > /dev/null 2> /dev/null &'
alias fucking='sudo'
alias fuckyou='sudo'
alias functions='subl ~/.bash_functions'
alias gdrive='sudo gdfs -o big_writes -o allow_other /home/$USER/.config/gdfs/gdfs.auth /media/$USER/gdfs'
#alias github='git clone https://github.com/ocaballeror/laughing-goggles.git'
alias g++='g++ -std=c++14'
alias hask='ghci'
alias haskell='ghci'
alias indigo='/opt/eclipse-indigo/eclipse > /dev/null 2> /dev/null &'
alias lsç='ls'
alias lslbk='lsblk'
alias less='less -r'                          # raw control characters
alias mdkir='mkdir'
alias mega='megasync > /dev/null 2> /dev/null &'
alias mem='free -mlt'
alias mkdir='mkdir -p'
alias mount='sudo mount'
alias mroe='more'
alias mydu='du -hs .[!.]* * 2> /dev/null | sort -hr | more'
alias mydu2='du -hs .[!.]* */* 2> /dev/null | sort -hr | more'
alias mydu3='du -hs .[!.]* */*/* 2> /dev/null | sort -hr | more'
alias mydu4='du -hs .[!.]* */*/*/* 2> /dev/null | sort -hr | more'
alias mydu5='du -hs .[!.]* */*/*/*/* 2> /dev/null | sort -hr | more'
alias ny='vpn US_New_York_City'
alias path='echo $PATH'
alias pkill='pkill -e'
alias protege='/opt/Protege/Protege > /dev/null 2> /dev/null &'
alias publicip='ip="$(wget https://ipinfo.io/ip -qO -)"; loc="$(wget http://ipinfo.io/city -qO -)"; [ -z $loc ] && loc="$(wget http://ipinfo.io/country -qO -)"; echo "$ip -- $loc"; unset ip; unset loc'
alias quit='exit'
alias receivebash='receivedots'
#alias receivedots='for dot in bashrc bash_aliases bash_functions vimrc tmux.conf; do cp ~/Shared/.$dot ~; done; reload'
alias receivedots='git clone https://github.com/ocaballeror/dotfiles.git && for file in $(find dotfiles -mindepth 2 | grep -v .git); do cp $file ~; done; rm -rf dotfiles'
alias reload='source $HOME/.bashrc'
alias sduo='sudo'
alias sever='server'
alias sl='ls'
alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias src='nano ~/.bashrc'
alias sshPhone='ssh root@192.168.1.39'
alias sshrasp='ssh pi@192.168.1.120'
alias start='vpn && drive && cd -'
alias sulb='subl'
alias swipl.='swipl'
alias tor='tar -xf $(ls ~/Data/Software/GNU+Linux/tor* | tail -1) -C . && cd tor-browser* && ./start-tor-browser.desktop >/dev/null 2>/dev/null; cd ..; rm -rf tor-browser* &'
alias trash='gvfs-trash'
alias umount='sudo umount'
#alias update='sudo apt-get clean && sudo apt-get update && sudo apt-get autoremove && sudo apt-get upgrade'
alias update='yaourt -Syu --devel --aur --noconfirm'
alias fullupdate='yaourt -Syu --devel --aur --noconfirm && yaourt -Syu --devel --aur'
alias vms='cd /media/$USER/Data/Software/VirtualBoxVMs/'
alias watchip='watch "wget https://ipinfo.io/ip -qO -"'
alias whence='type -a'                        # where, of a sort
alias wireshark='sudo wireshark-gtk > /dev/null 2> /dev/null &'
