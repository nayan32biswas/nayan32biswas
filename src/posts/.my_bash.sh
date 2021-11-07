##################################################
#		Important Value
##################################################

umask 0002 # for default permission

##################################################
#		PS1 Start
##################################################

# get current branch in git repo

function parse_git_branch() {
        BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
        if [ ! "${BRANCH}" == "" ]
        then
                STAT=`parse_git_dirty`
                echo "[${BRANCH}${STAT}]-"
        else
                echo ""
        fi
}

# get current status of git repo

function parse_git_dirty {
        status=`git status 2>&1 | tee`
        dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
        untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
        ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
        newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
        renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
        deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
        bits=''
        if [ "${renamed}" == "0" ]; then
                bits=">${bits}"
        fi
        if [ "${ahead}" == "0" ]; then
                bits="*${bits}"
        fi
        if [ "${newfile}" == "0" ]; then
                bits="+${bits}"
        fi
        if [ "${untracked}" == "0" ]; then
                bits="?${bits}"
        fi
        if [ "${deleted}" == "0" ]; then
                bits="x${bits}"
        fi
        if [ "${dirty}" == "0" ]; then
                bits="!${bits}"
        fi
        if [ ! "${bits}" == "" ]; then
                echo " ${bits}"
        else
                echo ""
        fi
}
function nonzero_return() {
        RETVAL=$?
        [ $RETVAL -ne 0 ] && echo "$RETVAL"
}

# export bash promt
export PS1="\[\e]0;\t - \u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\`parse_git_branch\`\[\033[01;34m\]\W\[\033[00m\]\`nonzero_return\`\$ "


##################################################
#                 ALIAS Start
##################################################

# GIT START
function nngit {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'` 
	git add .
	if [ ! "$1" == "" ]
	then
		git commit -m "$1"
	else
		git commit -m "updata by BOT"
	fi
        if [ ! "${BRANCH}" == "" ]
        then
		git push origin "${BRANCH}"
        else
                echo "No branch found"
        fi
}
export -f nngit

function nncommit {
        git add .
        if [ ! "$1" == "" ]
        then
                git commit -m "$1" 
        else
                git commit -m "updata by BOT"
        fi
}
export -f nncommit

function nnpush {
        BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
        if [ ! "${BRANCH}" == "" ]
        then
                git push origin "${BRANCH}"
        else
                echo "No branch found"
        fi
}
export -f nnpush
# GIT END


# This will support `mkfile ./a/b/c/file.txt`
nnmkfile() { mkdir -p "$(dirname "$1")" && touch "$1" ;  }
nnchown() { sudo chown -R $USER:$USER ${1:-./}; }

alias nnls="ls | less"
alias nnsuspend="systemctl suspend -i"
alias nnpoweroff="systemctl poweroff"
alias nnreboot="systemctl reboot"

alias nnmyproduction="yarn build && rm -rf ./site/{css,js,img,index.html,favicon.ico} && cp -rv ./dist/* ./site/"

# Test function
function nntest() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	echo "Branch name = ${BRANCH}";
}
