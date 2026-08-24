# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias python="python3"

set -o vi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# funktioner
to-emacs() {
  local tmp=$(mktemp)
  cat > "$tmp"
  emacsclient --eval "(with-current-buffer (get-buffer-create \"*shell-output*\") (erase-buffer) (insert-file-contents \"$tmp\") (display-buffer (current-buffer)))"
  rm "$tmp"
}
eval "$(mise activate zsh)"

alias ll="ls -lah"
alias ls="eza"
alias tree="eza -TL"
alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias mo-dry="mo clean --dry-run"
alias cr="cabal repl"
alias cb="cabal build"
alias reload="source ~/.zshrc"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf bruger fd
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
export FZF_CTRL_T_OPTS="--preview 'bat --color=always {} 2>/dev/null || cat {}'"

proj() {
  cd "$(fd --type d --max-depth 2 . ~/projects ~/scratch ~/university | fzf)"
}

home() {
  cd "$(fd --type d --max-depth 2 . \
    ~/Projects ~/Scratch ~/Archive \
    ~/Documents ~/Downloads ~/Desktop \
    ~/Music-Production \
    | fzf)"
}

dotfiles() {
    cd "$(fd --hidden --exclude .git --max-depth 3 . ~/dotfiles | fzf)"
}

boox() {
    cd "$(fd --hidden --exclude .git --max-depth 4 . ~/pCloud\ Drive/FolderSync/Boox | fzf)"
}

bats-exerc() {
    BATS_RUN_SKIPPED=true command bats *.bats
}

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/andersskibsted/.opam/opam-init/init.zsh' ]] || source '/Users/andersskibsted/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
