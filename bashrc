#
# ~/.bashrc
#

#
# Add the following to the ~/.bashrc
#
# if [ -f ~/git/dot_files/bashrc ]; then
#     . ~/git/dot_files/bashrc
# fi


export PAGER=/usr/bin/less
export EDITOR=/usr/bin/vim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'

alias ll='ls -l --color=auto'
alias lt='ls -ltr | tail -n $LINES'
alias zp='zathura *.pdf &'
alias bb='. ~/.bashrc'

alias rmtex='rm *.bbl *.aux msNotes.bib *.synctex.gz *.blg *.log'


function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
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

export PS1="\u\[\e[32m\]@\[\e[m\]\h:\[\e[34m\]\W\[\e[m\] \[\e[33m\]\`parse_git_branch\`\[\e[m\]\\$ "

#alias bf='python ~/research/disk-snowlines/src/models/bayessianFoo.py'

################################################################################
#                                 Make Backups                                 #
################################################################################
alias ddate='date +%Y%m%d'
alias mkdb='mkdir -p backups/$(ddate); cp -p *.* backups/$(ddate)/; mv -p .*.sw* backups/$(ddate)'


################################################################################
#                            External Bash Scripts                             #
################################################################################
if [ -f ~/git/my_bash_tools/pdf_search.bash ]; then
    . ~/git/my_bash_tools/pdf_search.bash
fi

if [ -f ~/git/my_bash_tools/mmgg.bash ]; then
    . ~/git/my_bash_tools/mmgg.bash
fi
