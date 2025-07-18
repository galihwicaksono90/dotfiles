source $HOME/.config/aliasrc
export EDITOR=nvim
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.config/emacs/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export GOPATH="$HOME/Documents/go"
export PATH="$PATH:$HOME/Documents/go/bin"
export NVM_DIR="$HOME/.config/nvm"
export ANDROID_HOME="/opt/android-sdk"
export MsBuildSDKsPath="/usr/share/dotnet/sdk/6.*/Sdks"
export MsBuildSDKsPath="/usr/share/dotnet/sdk/6.*/Sdks"
export JAVA_HOME="/usr/lib/jvm/default-runtime/"
# set PATH $PATH:$ANDROID_HOME/cmdline-tools/latest/bin
# set PATH $PATH:$ANDROID_HOME/tools/bin export 

set -gx NVM_DIR $HOME/.config/nvm
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_visual block

# turn off vi mode indicator
function fish_mode_prompt
end

# set vi mode as default 
# set -g fish_key_bindings fish_vi_key_bindings

# keybindings
# bind -M insert 'jj' 'set fish_bind_mode default ; commandline -f repaint'
bind -M insert \cy 'accept-autosuggestion'
bind -M insert \cn 'up-or-search'
bind -M insert \cp 'down-or-search'

# get color from xresources
# set fish_color_selection --background=()
set fish_color_normal white 
set fish_color_command yellow 
set fish_color_redirection magenta
set fish_color_error red
set fish_color_param normal
set fish_color_comment white
set fish_color_quote normal
set fish_color_search_match cyan
set fish_color_autosuggestion blue
set fish_color_cancel red

set fish_pager_color_progress cyan
set fish_pager_color_prefix yellow
set fish_pager_color_completion blue
set fish_pager_color_description magenta
set fish_pager_color_selected_background --background=blue
set fish_pager_color_selected_prefix black
set fish_pager_color_selected_completion black
set fish_pager_color_selected_description black

abbr yz yazi
abbr v nvim

abbr ta tmux attach -t
abbr tad tmux attach -t -d
abbr ts tmux new-session -s
abbr tl tmux list-session
abbr tksv tmux kill-server
abbr tkss tmux kill-session -t

abbr lg lazygit

pyenv init - | source

# bass source ~/.config/nvm/nvm.sh

# function nvm
#   bass source ~/.config/nvm/nvm.sh --no-use ';' nvm $argv
# end

# set -x NVM_DIR ~/.nvm
# nvm use default --silent

starship init fish | source
