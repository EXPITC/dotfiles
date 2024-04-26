 # Version 4 panel
# function ide --wraps='tmux split-window -v -p 30 && tmux split-window -h -p 66 && tmux split-window -h -p 50 || tmux' --description 'alias ide tmux split-window -v -p 30 && tmux split-window -h -p 66 && tmux split-window -h -p 50 || tmux'
#   tmux split-window -v -p 30 && tmux split-window -h -p 66 && tmux split-window -h -p 50 || tmux $argv; 
# end
# Version 3 panel
function ide --wraps='tmux split-window -v -p 30 && tmux split-window -h -p 66 && tmux split-window -h -p 50 || tmux' --description 'alias ide tmux split-window -v -p 30 && tmux split-window -h -p 66 && tmux split-window -h -p 50 || tmux'
  tmux split-window -v -p 30 && tmux split-window -h -p 40 || tmux $argv; 
end
