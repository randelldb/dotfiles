# Powerlevel10k instant prompt (must be first)
if [[ -r ~/.p10k.zsh ]]; then
  source ~/.p10k.zsh
fi

# Always add Homebrew bin FIRST
export PATH="/opt/homebrew/bin:$PATH"

# Load Homebrew env (optional, modern practice)
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set Oh My Zsh theme
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="arrow"
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
	git
	docker
    zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Optional: jenv should respect the already clean PATH
#export PATH="$HOME/.jenv/bin:$PATH"

# NVM setup (after PATH is set correctly)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if [ -f ".nvmrc" ]; then
  nvm install
  nvm use
fi

# Aliases
alias vim=nvim
alias whichpython='which python3'
alias pythonversion='python3 --version'

# Syntax highlighting (at the end is fine)
source /Users/randellbakker/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Load Angular CLI autocompletion.
source <(ng completion script)

# Fuzzy cd to a directory inside ~
cdf() {
  local dir
  if command -v fd >/dev/null 2>&1; then
    dir="$(fd -t d . ~ | fzf)"
  else
    dir="$(find ~ -type d 2>/dev/null | fzf)"
  fi
  [ -n "$dir" ] && cd "$dir"
}

export TERM=xterm-256color
export COLORTERM-truecolor
