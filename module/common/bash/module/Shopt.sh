shopt -s dotglob
shopt -s globstar
shopt -s autocd
shopt -s extglob
set -o vi

exec {BASH_XTRACEFD}>/dev/null
