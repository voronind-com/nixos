shopt -s dotglob
shopt -s globstar
shopt -s autocd
shopt -s extglob

#################### VIM ####################
# FOR MORE INFORMATION CHECK:
# https://wiki.archlinux.org/index.php/Readline

# TURN ON VIM (E.G. FOR READLINE)
bind 'set editing-mode vi'

# SHOW THE VIM MODE IN THE PROMPT (COMMAND OR INSERT)
bind 'set show-mode-in-prompt on'

# SET THE MODE STRING AND CURSOR TO INDICATE THE VIM MODE
#   FOR THE NUMBER AFTER `\e[`:
#     0: blinking block
#     1: blinking block (default)
#     2: steady block
#     3: blinking underline
#     4: steady underline
#     5: blinking bar (xterm)
#     6: steady bar (xterm)
bind 'set vi-ins-mode-string \1\e[6 q\2'
bind 'set vi-cmd-mode-string \1\e[2 q\2'

exec {BASH_XTRACEFD}>/dev/null
