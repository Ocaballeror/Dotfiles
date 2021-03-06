#### Most of this will be overriden by powerline

# The modes {{{
setw -g clock-mode-colour colour135
setw -g mode-style 'fg=colour6 bg=colour238 bold'
#}}}

# The panes {{{
set -g pane-border-style fg=colour239
set -g pane-active-border-style fg=colour51
# }}}

# The statusbar {{{
set -g status-position bottom
set -g status-left ''
set -g status-interval 2
set -g status-justify left
if-shell '. ~/.bash_customs && [ -n "$LIGHT_THEME" ] && $LIGHT_THEME'\
	'set -g status-style bg=colour255;\
	 set -g status-right "#[fg=colour233,bg=colour251,bold] %d/%m #[fg=colour233,bg=colour253,bold] %H:%M:%S "'\
	'set -g status-style bg=colour234;\
	 set -g status-right "#[fg=colour233,bg=colour241,bold] %d/%m #[fg=colour233,bg=colour245,bold] %H:%M:%S "'
set -g status-right-length 50
set -g status-left-length 20

# Window tabs {{{
if-shell '. ~/.bash_customs && [ -n "$LIGHT_THEME" ] && $LIGHT_THEME'\
	'setw -g window-status-current-format " #I#[fg=colour239]:#[fg=colour232]#W#[fg=colour33]#F " ;\
	 setw -g window-status-format " #I#[fg=colour233]:#[fg=colour233]#W#[fg=colour239]#F "'\
	\
	'setw -g window-status-current-format " #[fg=colour50,bold]#I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F " ;\
	 setw -g window-status-format " #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F "'


setw -g window-status-bell-style 'bg=colour1 fg=colour255 bold'
# }}}
# }}}

# The messages {{{
set -g message-style 'bg=colour166 fg=colour232 bold'
# }}}

# Powerline {{{
# This is totally a hack, but it allows me to keep everything inside this file. Basically this
# horrific line finds powerline's bindings directory and makes tmux source the correct one
run-shell '[ -z $POWERLINE_DISABLE ] || exit 0;\
powerline_root=$(python2 -c "from powerline.config import POWERLINE_ROOT; print (POWERLINE_ROOT)" 2>/dev/null);\
[ -n "$powerline_root" ] || powerline_root=$(python -c "from powerline.config import POWERLINE_ROOT; print (POWERLINE_ROOT)" 2>/dev/null);\
[ ! -f "$powerline_root/powerline/bindings/tmux/powerline.conf" ] || tmux source "$powerline_root/powerline/bindings/tmux/powerline.conf"'

# }}}

# vim: fdm=marker ft=tmux
