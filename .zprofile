#!/bin/zsh

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

# Default programs:
export EDITOR="nvim"
export BROWSER="brave"
export TERMINAL="alacritty"
export VISUAL="$EDITOR"
export PAGER="less"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export KODI_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/kodi"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
export UNISON="${XDG_DATA_HOME:-$HOME/.local/share}/unison"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.vim" | so $MYVIMRC'
export MOST_INITFILE="$XDG_CONFIG_HOME/most/mostrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR/npm"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export GNUPGHOME=${XDG_CONFIG_HOME}/gnupg
export LESSHISTFILE="${XDG_CACHE_HOME}/less/history"
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

# Telemetry opt-out
export DOTNET_CLI_TELEMETRY_OPTOUT='1'

# Android SDK
export ANDROID_HOME=$XDG_DATA_HOME/android-sdk
export PATH=$ANDROID_HOME/cmdline-tools/tools/bin:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

