# ====================
# --- BASIC CONFIG ---
# ====================


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# History length 
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# fancy, coloured prompt 
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Colour support
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# rust stuff
. "$HOME/.cargo/env"

# --- Android SDK (added for Android testing) ---
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
# --- end Android SDK ---

# Make programs available system-wide
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:/home/main/dart-sass
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/go/bin:$HOME/go/bin:$PATH"


# make neovim the default editor
export EDITOR=nvim
export VISUAL=nvim

# =========================================================================
# MY STUFF ---------------------------------------------------------------
# MY STUFF ---------------------------------------------------------------
# MY STUFF ---------------------------------------------------------------
# =========================================================================
 
# up arrow to go back through history
bind '"\e[A": history-search-backward'

# down arrow to go forward through history
bind '"\e[B": history-search-forward'

# show all completion options on first tab press
bind 'set show-all-if-ambiguous on'

# case insensitive tab completion
bind 'set completion-ignore-case on'
 
# Auto-start tmux server (but don't attach)
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
    tmux
fi

# -- ENTER TO CLEAR --

command1()
{
    if [ "$BASH_COMMAND" != command2 ]
    then
        command_flag=1
    fi
    return 0
}
trap command1 debug
command2()
{
    if [ ! "$command_flag" ]
    then
        clear                            # Put whatever command(s) you want here.
    fi
    command_flag=
}
PROMPT_COMMAND=command2
 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ==> COMMANDS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# find files by name pattern
lfind() {
    find . -type f -name "*$1*"
}
 
# list files
alias l='ls'
 
# change directory and list contents
d() {
    cd "$1" || return
    ls | head -n 30
}
 
# Go up one directory and list contents
du() {
    cd ..
    ls | head -n 30
}

duu() {
    cd ../..
    ls | head -n 30
}

duuu() {
    cd ../../..
    ls | head -n 30
}

duuuu() {
    cd ../../../..
    ls | head -n 30
}
 
# copy into clipboard.
#   ==> e.g. echo "hello" | copy
#   ==> e.g. ls && copy
unalias copy 2>/dev/null  # an old alias would break this definition on re-source
copy() {
  if [ ! -t 0 ]; then
    xclip -sel c
  else
    eval "$(fc -ln -1 | sed 's/^\s*[0-9]*\s*//')" | xclip -sel c
  fi
}

# source bashrc
alias src="source ~/.bashrc"

# turn off laptop
alias shutdown="sudo shutdown now"

# laptop on standbye
alias end='sudo systemctl hibernate'

# runs neovim
vim() {
    nvim "$@"  

    # After existing neovim:
    #   --> cd's you into the folder that you were in, whilst in neovim.
    #   --> e.g. I'm in $HOME dir. 
    #            I then open neovim with a file at ~/home/example/innerDir/text.txt, 
    #            When I exit neovim, I'll be auto-cd'd to ~/home/example/innerDir/
    LAST_DIR_FILE="$HOME/.cache/nvim/last_dir"
    if [[ -s "$LAST_DIR_FILE" ]]; then
        LAST_DIR=$(<"$LAST_DIR_FILE")
        if [[ -d "$LAST_DIR" ]]; then
            cd "$LAST_DIR"
            echo "Changed directory to: $LAST_DIR"
        fi
        > "$LAST_DIR_FILE"  
    fi
}

# Run file explorer
function f() {
    nvim .

    # After existing neovim:
    #   --> cd's you into the folder that you were in, whilst in neovim.
    #   --> e.g. I'm in $HOME dir. 
    #            I then open neovim with a file at ~/home/example/innerDir/text.txt, 
    #            When I exit neovim, I'll be auto-cd'd to ~/home/example/innerDir/
    LAST_DIR_FILE="$HOME/.cache/nvim/last_dir"
    if [[ -s "$LAST_DIR_FILE" ]]; then
        LAST_DIR=$(<"$LAST_DIR_FILE")
        if [[ -d "$LAST_DIR" ]]; then
            cd "$LAST_DIR"
            echo "Changed directory to: $LAST_DIR"
        fi
        > "$LAST_DIR_FILE"  # clear the file
    fi
}


# Open an image
alias view='sxiv -o'

 # 1. The standalone command to silence all mp4s in the current folder
makesilent () {
    shopt -s nullglob
    mapfile -t FILES < <(printf "%s\n" *.mp4 | sort -V)

    if [ ${#FILES[@]} -eq 0 ]; then
        echo "No mp4 files found."
        return 1
    fi

    for f in "${FILES[@]}"; do
        echo "Processing: $f"
        # Create a temp file, then move it over the original if successful
        if ffmpeg -y -i "$f" -an -c:v copy "tmp_$f" >/dev/null 2>&1; then
            mv "tmp_$f" "$f"
        else
            echo "Error processing $f"
            rm -f "tmp_$f"
        fi
    done
    echo "Done! All files are now silent."
}

# ============================================

record() {
    # Exit cleanly if a command fails or an unset variable is used inside this function
    local EPISODE="${1:-episode}"
    local RAW_FILE="raw_${EPISODE}.wav"
    local OUTPUT="${EPISODE}.wav"

    echo "running audio capture"

    # Save and temporarily restore PATH if needed
    export PATH="$HOME/.local/bin:$PATH"

    local DEVICE_NAME
    DEVICE_NAME=$(wpctl inspect @DEFAULT_AUDIO_SOURCE@ | grep 'node.description' | cut -d'"' -f2)

    echo "---------------------------------------------------------------"
    echo "🔍 PRE-FLIGHT CHECK"
    echo "🎙️  Current Input:  $DEVICE_NAME"
    echo "---------------------------------------------------------------"
    echo "👉 Press [ENTER] to start recording, or [Ctrl+C] to abort."
    read -r

    # ── RECORD ──────────────────────────────────────────────────────────
    echo "🎙 Recording → $RAW_FILE"
    echo "🔴 Recording is LIVE 🔴"
    echo "Press 'q' to stop"
    ffmpeg -y -f pulse -i default -ac 1 -ar 48000 "$RAW_FILE"
    echo "==================================="
    echo "Recording Done."

    # ── PROCESS (TONE + CONTROL) ────────────────────────────────────────
    echo "🎛 Processing..."
    ffmpeg -y -i "$RAW_FILE" -af "highpass=f=70,agate=threshold=-42dB:ratio=2:attack=10:release=200,equalizer=f=120:width_type=h:width=100:g=4,equalizer=f=3000:width_type=h:width=2000:g=2,acompressor=threshold=-20dB:ratio=2.5:attack=15:release=200,alimiter=limit=0.84,loudnorm=I=-19:TP=-1.5:LRA=11" "$OUTPUT"

    echo "---------------------------------------------------------------"
    echo "✅ DONE"
    echo "🎧 Final: $OUTPUT"
    echo "🗂 Raw:   $RAW_FILE"
    echo "▶ Preview: aplay $OUTPUT"
}

# ============================================


# push changes to source control
# 's' for 'save'  -> default commit message
# e.g. "s " (space runs it instantly, see _INSTANT_CMDS below)
s() {
  git add .
  git commit -m "another commit - $(date +'%d/%m/%Y %H:%M')"
  git push
}

# 'sm' for 'save message' -> custom commit message
# e.g. "sm this is a big change<enter>"
sm() {
  if [ -z "$*" ]; then
    echo "sm: no commit message given (use 's' for the default message)" >&2
    return 1
  fi

  git add .
  git commit -m "$*"
  git push
}


# ============================================

# ai frenemies
alias a='claude'

 # ============================================

# jump to 'TODO' (t was too hard to reach)
j() {
    if [ -f "TODO.md" ]; then
        nvim "TODO.md"
    else
        f
    fi
}

# ============================================

# 'next' tmux pane.

n() {
    tmux select-pane -t :.+
}

# ============================================

# Instant commands: type the word / letter, then SPACE runs it (no Enter).
# e.g. "f " behaves like "f<enter>"
_INSTANT_CMDS=" f s l j du duu duuu duuuu a n "   # space-separated list of trigger words
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# !!! ENSURE THERE IS A SPACE AFTER THE LAST ENRTY ABOVE !!!

_instant_space() {
  if [[ $_INSTANT_CMDS == *" $READLINE_LINE "* ]] \
     && [[ $READLINE_POINT -eq ${#READLINE_LINE} ]] \
     && [[ $READLINE_LINE != *[[:space:]]* ]]; then
    local cmd=$READLINE_LINE
    READLINE_LINE=""; READLINE_POINT=0
    printf '\n'
    history -s -- "$cmd"
    eval -- "$cmd"
  else
    READLINE_LINE="${READLINE_LINE:0:READLINE_POINT} ${READLINE_LINE:READLINE_POINT}"
    (( READLINE_POINT++ ))
  fi
}

case $- in
  *i*) bind -x '" ": _instant_space' ;;
esac


# ==========================================================
# ==========================================================
# ==========================================================
# ==========================================================
# ==========================================================
# ==========================================================

# EMULATOR

_emulator_complete() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local devices

    devices=$(adb devices | awk 'NR > 1 && $2 == "device" {print $1}')

    COMPREPLY=($(compgen -W "$devices" -- "$cur"))
}

emulator() {
    if [ -z "$1" ]; then
        echo "Current device: ${ANDROID_SERIAL:-<none>}"
        return
    fi

    export ANDROID_SERIAL="$1"
    echo "ANDROID_SERIAL=$ANDROID_SERIAL"
}

complete -F _emulator_complete emulator

# ==========================================================
# ==========================================================
