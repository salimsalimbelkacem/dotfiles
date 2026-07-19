if status is-interactive
    date
end

alias vi nvim
alias vim nvim
alias v  nvim
alias t  tmux

alias cp 'cp -v'
alias mv 'mv -v'

alias man 'man --pager="nvim +Man!"'
alias yay 'yay --noconfirm'

alias neofetch fastfetch

set -x PATH 				\
"$HOME/go/bin" 				\
"$HOME/.local/share/gem/ruby/3.4.0/bin" \
"$HOME/.local/bin/" 		\
"$HOME/.bun/bin" 			\
"$HOME/.cargo/bin" 			\
"$HOME/.venv/bin" 			\
"/usr/lib/emsdk" 			\
"/usr/lib/emsdk/upstream/emscripten" $PATH
    
set -gx QT_QPA_PLATFORMTHEME qt6ct

fish_vi_key_bindings

# opencode
fish_add_path /home/salim/.opencode/bin

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/salim/.ghcup/bin $PATH # ghcup-env
