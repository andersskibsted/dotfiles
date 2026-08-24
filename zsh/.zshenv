
eval "$(/opt/homebrew/bin/brew shellenv)"

. "$HOME/.cargo/env"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="/Applications/SuperCollider.app/Contents/MacOS/:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/qt/6.8.1/macos/bin:$PATH"
export PATH="/Users/andersskibsted/.dotnet/tools:$PATH"
export EDITOR=nvim

[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"

# uv
export PATH="/Users/andersskibsted/.local/bin:$PATH"
