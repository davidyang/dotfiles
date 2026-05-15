# The following lines were added by compinstall
zstyle :compinstall filename '/Users/dyang/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="/Users/dyang/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls -G'

setopt menu_complete

# Find and set branch name var if in git repository.
function parse_git_branch() {
    local branch
    branch=$(git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p')
    if [ -n "$branch" ]; then
        echo " [${branch}]"
    fi
}

PS1='%n@$(hostname | cut -d. -f1) %F{cyan}%~%f%F{green}$(parse_git_branch)%f %% '



setopt PROMPT_SUBST

export EDITOR='subl -w'
export PATH=$PATH:~/bin:~/go/bin

export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

source /Users/dyang/Dropbox/dotfiles/etc/zsh-z/zsh-z.plugin.zsh
zstyle ':completion:*' menu select

ssh-add -q

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

export PATH=~/n/bin:$PATH

export HOMEBREW_NO_AUTO_UPDATE=1 

export PATH="/Users/dyang/bin:$PATH"
zstyle ':completion:*' rehash true

alias yt-dlp=yt-dlp -S res,ext:mp4:m4a --recode mp4

#eval "$(atuin init zsh --disable-up-arrow)"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


_bb_tasks() {
    local matches=(`bb tasks |tail -n +3 |cut -f1 -d ' '`)
    compadd -a matches
    _files # autocomplete filenames as well
}
compdef _bb_tasks bb

alias vi=nvim
alias vim=nvim
function lwldev() {
	for p in server tailwind livereload  # codewatch beansync
	do bb dev run $p 
	done
}

launchctl load ~/Library/LaunchAgents/com.dyang.keyboardremap.plist 2>/dev/null

alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

remap_ctrl() {
	hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x7000000e6,"HIDKeyboardModifierMappingDst":0x7000000e0}]}' --matching '{"ProductID":0x0}' > /dev/null
}

remap_ctrl
export PATH="$HOME/.local/bin:$PATH"
sgit() { (nohup /Applications/SmartGit.app/Contents/MacOS/SmartGit "$@" >/dev/null 2>&1 &) }
alias g=git 
alias tailscale='/Applications/Tailscale.app/Contents/MacOS/Tailscale'


# opencode
export PATH=/Users/dyang/.opencode/bin:$PATH

# bun completions
[ -s "/Users/dyang/.bun/_bun" ] && source "/Users/dyang/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# lazyworktree
alias lw=lazyworktree
source /Users/dyang/go/pkg/mod/github.com/chmouel/lazyworktree@v1.45.0/shell/functions.zsh
jt() { worktree_jump $(git rev-parse --show-toplevel) "$@"; }


itab() {
    # itab <N>  — open iTerm2 tab for ~/dev/lwl/ibworktrees/worktree<N>
    #   top-left  : cd app; LWL_HTTPS_PORT=844(2+N) bb dev nrepl app
    #   bottom-left (~20% h): plain shell at worktree root
    #   right     : plain shell at worktree root (for claude/codex)
    local n="${1:-1}"
    local wt_dir="$HOME/dev/lwl/ibworktrees/worktree${n}"
    local https_port=$((8442 + n))
    local wt_label="WT${n}"

    # Per-worktree VSCode titleBar.activeBackground (hardcoded; mirrors
    # .vscode/settings.json in each worktree). Used as the iTerm tab color
    # so the iTerm tab visually pairs with the VSCode title bar.
    local wt_color
    case "$n" in
        1) wt_color="007ACC" ;;  # blue
        2) wt_color="16825D" ;;  # green
        3) wt_color="D67E15" ;;  # orange
        4) wt_color="663399" ;;  # purple
        5) wt_color="B52E31" ;;  # red
        *) wt_color="D4D4D4" ;;  # fallback: VSCode editor gray
    esac
    local wt_r=$((16#${wt_color:0:2}))
    local wt_g=$((16#${wt_color:2:2}))
    local wt_b=$((16#${wt_color:4:2}))

    if [[ ! -d "$wt_dir" ]]; then
        echo "itab: $wt_dir does not exist" >&2
        return 1
    fi

    # base64-encoded badge strings (iTerm SetBadgeFormat expects base64)
    local badge_top="$(printf 'WT%s\n:%s\nnrepl' "$n" "$https_port" | base64)"
    local badge_bot="$(printf 'WT%s\nshell' "$n" | base64)"
    local badge_right="$(printf 'WT%s\nagent' "$n" | base64)"

    osascript - "$wt_label" "$wt_dir" "$https_port" "$badge_top" "$badge_bot" "$badge_right" "$wt_r" "$wt_g" "$wt_b" <<'EOF'
on run argv
  set wtLabel to item 1 of argv
  set wtDir to item 2 of argv
  set httpsPort to item 3 of argv
  set badgeTop to item 4 of argv
  set badgeBot to item 5 of argv
  set badgeRight to item 6 of argv
  set wtR to item 7 of argv
  set wtG to item 8 of argv
  set wtB to item 9 of argv

  set titlePrefix to wtLabel & " - "

  -- Type the literal characters "\e" and "\a" into the shell; the shell's
  -- printf interprets them as ESC and BEL. We can't type raw ESC/BEL because
  -- ESC would flip zsh into vi-command mode and discard the rest of the line.

  -- Tab background color = VSCode titleBar.activeBackground for this worktree.
  -- Set via OSC 6;1;bg;<channel>;brightness;<0-255>. iTerm tracks tab color
  -- per session and displays the active session's color, so emit from every pane.
  set tabColorCmd to "printf '\\e]6;1;bg;red;brightness;" & wtR & "\\a\\e]6;1;bg;green;brightness;" & wtG & "\\a\\e]6;1;bg;blue;brightness;" & wtB & "\\a'"

  -- Override OMZ's title() so the tab title is always "WTn - <command>".
  set titleCmd to "_itab_label='" & wtLabel & "'; title() { : ${2=$1}; print -Pn \"\\e]2;${_itab_label} - ${2:q}\\a\"; print -Pn \"\\e]1;${_itab_label} - ${1:q}\\a\"; }; title zsh"

  tell application "iTerm2"
    activate
    -- If a tab already shows our "WTn - …" title, select it instead of opening a new one.
    repeat with w in windows
      tell w
        repeat with t in tabs
          tell t
            set sessNames to name of sessions
            repeat with sn in sessNames
              if (sn as string) starts with titlePrefix then
                select t
                tell w to select
                return
              end if
            end repeat
          end tell
        end repeat
      end tell
    end repeat

    tell current window
      -- Save window geometry; splits + `set rows` otherwise enlarge the window.
      set savedBounds to bounds
      set newTab to (create tab with default profile)
      set topLeft to current session of newTab

      tell topLeft
        set rightPane to (split vertically with default profile)
      end tell

      tell topLeft
        set bottomLeft to (split horizontally with default profile)
      end tell

      try
        set totalRows to rows of topLeft
        set targetRows to (totalRows / 5) as integer
        if targetRows < 4 then set targetRows to 4
        set rows of bottomLeft to targetRows
      end try

      try
        set bounds to savedBounds
      end try

      tell topLeft
        write text tabColorCmd
        write text titleCmd
        write text "printf '\\e]1337;SetBadgeFormat=" & badgeTop & "\\a'"
        write text "cd " & quoted form of wtDir & "/app && LWL_HTTPS_PORT=" & httpsPort & " bb dev nrepl app"
      end tell

      tell bottomLeft
        write text tabColorCmd
        write text titleCmd
        write text "printf '\\e]1337;SetBadgeFormat=" & badgeBot & "\\a'"
        write text "cd " & quoted form of wtDir
      end tell

      tell rightPane
        write text tabColorCmd
        write text titleCmd
        write text "printf '\\e]1337;SetBadgeFormat=" & badgeRight & "\\a'"
        write text "cd " & quoted form of wtDir
      end tell

      select rightPane
    end tell
  end tell
end run
EOF
}

alias gw="git worktree"
