if status is-interactive
	fastfetch
end

alias vi nvim
alias cp 'cp -v'
alias mv 'mv -v'
alias man 'man --pager="nvim +Man!"'
alias yay 'yay --noconfirm'
alias neofetch fastfetch
alias sudo sl

set -x PATH 				\
"$HOME/go/bin" 				\
"$HOME/.local/share/gem/ruby/3.4.0/bin" \
"$HOME/.local/bin/" 			\
"$HOME/.bun/bin" 			\
"$HOME/.cargo/bin" 			\
"$HOME/.venv/bin" 			\
"/usr/lib/emsdk" 			\
"/usr/lib/emsdk/upstream/emscripten"	$PATH
    
set -gx QT_QPA_PLATFORMTHEME qt6ct

fish_vi_key_bindings
