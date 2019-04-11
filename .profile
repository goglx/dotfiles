alias ll='ls -la'

search_in_history() {
	echo $1:
	history | cut -c 8- | grep $1 | grep -v history | uniq -f 1
}
alias historys=search_in_history

export HISTCONTROL=ignoredups

#export PS1="@g \W$ "

complete -o default -o nospace -W "$(grep -i -e '^host ' ~/.ssh/config | awk '{print substr($0, index($0,$2))}' ORS=' ')" ssh scp sftp

if [ -f /Users/g/p/lecturio/workflows/gitflow-completion.sh ]; then
        . /Users/g/p/lecturio/workflows/gitflow-completion.sh
fi

GIT_PS1_SHOWDIRTYSTATE=true
. /usr/local/etc/bash_completion.d/git-completion.bash
. /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
export PS1='@g \W$(__git_ps1)\n\$ '

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.jdk_switch
