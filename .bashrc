

# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

HISTFILESIZE=100000
HISTSIZE=10000

shopt -s histappend
shopt -s extglob
shopt -s globstar
shopt -s checkjobs



if [[ ! -v BASH_COMPLETION_VERSINFO ]]; then
  . "/nix/store/4j5ac4npgfj9mdcvns5h5x46r6i6zy4g-bash-completion-2.17.0/etc/profile.d/bash_completion.sh"
fi

if [[ -n "${GHOSTTY_RESOURCES_DIR}" ]]; then
  builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/bash/ghostty.bash"
fi

if [[ $TERM != "dumb" ]]; then
  eval "$(/nix/store/1xi1yc9qksfcc620vqvnwxqf39jk35q1-starship-1.25.1/bin/starship init bash --print-full-init)"
fi

