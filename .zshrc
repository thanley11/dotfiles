# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Themes.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Case-sensitive completion.
CASE_SENSITIVE="false"

# Disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Disable marking untracked files under VCS as dirty.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# History.
HIST_STAMPS="yyyy-mm-dd"

# Plugins.
#plugins=(archive extract git)

# Environment variables.
source ~/.exports

# Oh My Zsh.
source ~/.oh-my-zsh/oh-my-zsh.sh

# User config.
source ~/.zsh/setopt.zsh

# Aliases.
source ~/.aliases
#source ~/.aliases_private

# Tracks your most used directories, based on frecency with z.
source ~/.oh-my-zsh/plugins/z/z.plugin.zsh

# dircolors.
if [ -x "$(command -v dircolors)" ]; then
    eval "$(dircolors -b ~/.dircolors)"
fi

# fzf key bindings.
#if [ -x "$(command -v fzf)" ]; then
    #source ~/.fzf/shell/key-bindings.zsh
#fi

# Manage SSH with Keychain.
if [ -x "$(command -v keychain)" ]; then
    eval "$(keychain --eval --quiet id_rsa_github id_rsa_gitlab)"
fi

# Base16 Shell.
if [ -f ~/.local/bin/base16-oxide ]; then
    source ~/.local/bin/base16-oxide
fi

PATH="/home/tom/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/tom/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/tom/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/tom/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/tom/perl5"; export PERL_MM_OPT;

# vim bindings
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize
