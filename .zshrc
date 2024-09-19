alias ls='ls --color'
alias ak='ssh-add -s /usr/local/lib/libykcs11.dylib'
alias v='nvim'
alias pbp='pbpaste'
alias k='kubectl'
alias ba='/opt/homebrew/bin/bash'

fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

xcr() {
read -rs SSHPASS; export SSHPASS;
PATH=$HOME/sshpasswrap:$PATH $HOME/xc;
}

transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n  transfer <file|directory>\n  ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl -H "Max-Downloads: 1" --progress-bar --upload-file "-" "https://t.bk.ru/$file_name"|tee /dev/null,;else cat "$file"|curl -H "Max-Downloads: 1" --progress-bar --upload-file "-" "https://t.bk.ru/$file_name"|tee /dev/null;fi;else file_name=$1;curl -H "Max-Downloads: 1" --progress-bar --upload-file "-" "https://t.bk.ru/$file_name"|tee /dev/null;fi;}

ssh() {
     if [ -n "$TMUX" ]; then
         tmux -2u rename-window "$(echo $* | rev | cut -d '@' -f1 | rev)";
         command ssh "$@";
         tmux -2u set-window-option automatic-rename "on" > /dev/null;
     else
         command ssh "$@";
     fi
 }

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# calculator
function = 
{
  echo "$@" | bc -l
}

alias calc="="

export EDITOR='/opt/homebrew/bin/nvim'

# zoxide
eval "$(zoxide init --cmd cd zsh)"

export LANG=en_US.UTF-8
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
alias ls='eza'
export PATH="/Users/ramil.zakirov/Documents/stuff/puppet-editor-services:/opt/homebrew/opt/ruby/bin:$PATH"
