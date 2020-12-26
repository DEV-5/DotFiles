#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

alias ls='ls --color=auto'
alias tmux='tmux -u'

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

#powerline settings
#source ~/.bash-powerline.sh

#export TERM="xterm-256color"
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
#. /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
#
#. /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
#end of powerline settings

#this for swapping caps and escape 
#commenting this as options to swap is available in system settings/keyboard 
# xmodmap -e "remove Lock = Caps_Lock"
# xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
# xmodmap -e "keycode 66 = Escape NoSymbol Escape"
# xmodmap -pke > ~/.xmodmap
#the end of swapping

#startup setup
neofetch --ascii_distro manjaro --color_blocks off --ascii_colors 4
#screenfetch -D arch
#cd ~/vector
#startup ends


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#export FZF_DEFAULT_OPS ="--extended"
#export FZF_DEFAULT_COMMAND='fd --type f'

#removing mapping ctrl+s to suspend
stty -ixon

#vi as vim allias
#alias vi="vim"

#adding cubeide dir to PATH
export PATH=/opt/stm32cubeide:$PATH  
#adding Atolic truestudio dir to PATH
export PATH=/opt/truestudio/ide:$PATH

#set cscope editor to vim
export CSCOPE_EDITOR=vim
export EDITOR=vim
#PS1="\[\033[1;31m\]\u@\h:\w\$"
PS1="\[\033[42m\]\[\033[31m\]\u@\h:\w\\[\033[00m\]\$ "

#GIT DOTFILES allias
alias config='/usr/bin/git --git-dir=$HOME/DotFiles/ --work-tree=$HOME'

#export LC_ALL=C # added for s-tui incase of any locale issue remove this
export LC_ALL="en_US.UTF-8"
#if [ -f /usr/lib/python3.4/site-packages/powerline/bindings/bash/powerline.sh ]; then
#    source /usr/lib/python3.4/site-packages/powerline/bindings/bash/powerline.sh
#fi
