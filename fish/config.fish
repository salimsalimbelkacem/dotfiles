set EDITOR  nvim
set PAGER "nvim +Man!"
set MANPAGER "nvim +Man!"
set fish_greeting
alias vi nvim

alias cp 'cp -v'
alias mv 'mv -v'

alias python "~/.venv/bin/python"
alias pip    "~/.venv/bin/pip"
alias man 'man --pager="nvim +Man!"'

export NEOCITIES_USER='pepelemoko'
export NEOCITIES_PASS='5LbpZ^9RG;A"Gc%'

set -x PATH /home/salim_belkacem/go/bin $PATH
set -x PATH /home/salim_belkacem/.local/share/gem/ruby/3.4.0/bin $PATH

if status is-interactive
	neofetch
    # Commands to run in interactive sessions can go here
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export PATH "$HOME/.cargo/bin/" $PATH
