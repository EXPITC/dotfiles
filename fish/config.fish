set fish_greeting "𝕸𝖆𝖉𝖊 𝖔𝖓 𝕰𝖆𝖗𝖙𝖍 𝖇𝖞 𝖍𝖚𝖒𝖆𝖓𝖘."

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias bake "eslint_d start;prettierd start"
alias cake "eslint_d stop;prettierd stop"
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
function gl 
  git log --pretty=format:"\"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(RESET)\"" --graph --date=relative --decorate --all
end
# alias "gl" "git log --pretty=format:"\"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(RESET)\"" --graph --date=relative --decorate --all"
# need speed test cli
alias ist "speedtest"
# ide alias when tmux not running exec tmux instead
# alias ide "tmux split-window -v -p 30 && tmux split-window -h -p 66 && tmux split-window -h -p 50 || tmux"
command -qv nvim && alias vim nvim

# If I have exa update the alias
if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

# pnpm
set -gx PNPM_HOME "/Users/expitc/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
