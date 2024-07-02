# .zshrc Config File

if [ -z "${DISPLAY}" ] && [ $(tty) = /dev/tty1 ]; then
  exec startx
fi
source ~/Repos/zsh-autocomplete/zsh-autocomplete.plugin.zsh # If you come from bash you might have to change your $PATH. export PATH=$HOME/bin:/usr/local/bin:$PATH export PATH=$PATH:~/Scripts/ source ~/.bashrc source ~/Repos/zsh-autocomplete/zsh-autocomplete.plugin.zsh
() {
   local -a prefix=( '\e'{\[,O} )
   local -a up=( ${^prefix}A ) down=( ${^prefix}B )
   local key=
   for key in $up[@]; do
      bindkey "$key" up-line-or-history
   done
   for key in $down[@]; do
      bindkey "$key" down-line-or-history
   done
}
bindkey '^R' .history-incremental-search-backward
bindkey '^S' .history-incremental-search-forward

source "$HOME/.zsh/spaceship/spaceship.zsh"

bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
bindkey -M menuselect '\r' .accept-line

plugins=(git)

# Example aliases
alias nv="nvim"
alias zshconfig="nv ~/.zshrc"
alias nvimconfig="nv ~/.config/nvim/lua/settings"
alias alacrittyconfig="nv ~/.config/alacritty/alacritty.toml"
alias i3config="nv ~/.config/i3/config"
alias polybarconfig="nv ~/.config/polybar/config.ini"
alias cls="clear"
alias anime="ani-cli --rofi"
alias tmuxconfig="nv ~/.config/tmux/tmux.conf"
alias kittyconfig="nv ~/.config/kitty/kitty.conf"
alias manga='mangodl'
alias picomconfig="nv ~/.config/picom/picom.conf"
alias ls="ls -l"
alias batthealth='acpi -V'
alias vf='nv $(fzf)'
alias fm="nemo"
# alias ls="exa --icons"
# alias ll="exa --icons -l"
# alias tree="exa --tree --level=2"
# #
# Copy over Term info
# Copy if user is using kitty to ssh to remote server
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gawang/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gawang/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/gawang/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/gawang/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

fastfetch --logo ~/Pictures/random/char.jpg --logo-type kitty --logo-width 35 --logo-height 15

export PATH=$PATH:/home/gawang/.spicetify
