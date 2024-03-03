shopt -s dotglob
shopt -s globstar
shopt -s autocd
shopt -s extglob

exec {BASH_XTRACEFD}>/dev/null
