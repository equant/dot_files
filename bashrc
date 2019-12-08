#
# ~/.bashrc
#

export PAGER=/usr/bin/less
export EDITOR=/usr/bin/vim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:~/bin/:~/bin/my_bash_tools:~/bin/casa/bin:~/.local/bin
export PATH=$PATH:~/projects/luatool/luatool
export PATH=$PATH:~/research/tcha/src/modeling
export PATH=$PATH:~/research/tcha/src/visualization
export PATH=$PATH:/home/equant/bin/radmc-3d/version_0.41/src/radmc3d
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/lib
export LD_LIBRARY_PATH=$HOME/bin/MultiNest/lib:$LD_LIBRARY_PATH

# IDL Stuff...
export IDL_PATH=/usr/local/exelis/idl85/lib:/home/equant/bin/idl
#export PYTHONPATH=/home/equant/bin/python/
export PYTHONPATH=$PYTHONPATH:/home/equant/research/common_python_libs

alias ls='ls --color=auto'

alias ll='ls -l --color=auto'
alias lt='ls -ltr | tail -n $LINES'
alias zp='zathura *.pdf &'
alias bb='. ~/.bashrc'

alias rmtex='rm *.bbl *.aux msNotes.bib *.synctex.gz *.blg *.log'

alias mycasa='casa --nologger --log2term'
#alias conda='/home/equant/bin/miniconda3/bin/conda'

#alias fn='firefox -new-window % &


function fn {
    firefox -new-window $1 &
}

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
#                                GOTO Commands                                 #
################################################################################
#goto commands are now handled with mm/gg.
#export ggsl=~/research/scattered_light_water_absorption
#export ggnsf=~/research/funding/nsf/2016
#export ggw=~/research/disk-snowlines

alias pipe="cd ~/research/herschel/pythonScripts/pipeline"
#alias ggnsf="cd $ggnsf"
#alias ggsl="cd $ggsl"
#alias ggw="cd $ggw"

################################################################################
#                                 Make Backups                                 #
################################################################################
alias ddate='date +%Y%m%d'
alias mkdb='mkdir -p backups/$(ddate); cp -p *.* backups/$(ddate)/; mv -p .*.sw* backups/$(ddate)'

################################################################################
#                               Binary Shortcuts                               #
################################################################################
alias cv='~/bin/casa-release-4.5.2-el6/casaviewer'

##################################################
#     Directory Bookmarks (vimish bindings)      #
##################################################

#alias mm='export mm=`pwd`'
#alias gm='cd $mm'


################################################################################
#                            External Bash Scripts                             #
################################################################################
if [ -f ~/git/my_bash_tools/pdf_search.bash ]; then
    . ~/git/my_bash_tools/pdf_search.bash
fi

if [ -f ~/git/my_bash_tools/mmgg.bash ]; then
    . ~/git/my_bash_tools/mmgg.bash
fi


################################################################################
#                                  Dead Wood                                   #
################################################################################
#alias mkdb='mkdir -p backups/$(date +%Y%m%d)'
#alias prop='cd /home/equant/research/alma/proposals/cycle-04/snow_line_vs_mass_accretion_rate'
#alias mcprog='echo "Running..." ; ps aux | grep -i MCMaxLinux | wc -l; echo "Done..." ; ls -1 */done | wc -l'
#alias ljup='cd ~ ; jupyter notebook --certfile=.jupyter/mycert.pem --keyfile .jupyter/mykey.key'

# added by Miniconda3 4.3.21 installer
#export PATH="/home/equant/bin/miniconda3/bin:$PATH"

# added by Miniconda3 installer
export PATH="/home/equant/miniconda3/bin:$PATH"
