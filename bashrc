#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:~/bin/:~/bin/my_bash_tools:~/bin/casa/bin
export PATH=$PATH:~/research/disk-snowlines/src/modeling
export PATH=$PATH:~/research/disk-snowlines/src/visualization
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/lib

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ll='ls -l --color=auto'
alias lt='ls -ltr'

alias rmtex='rm *.bbl *.aux msNotes.bib *.synctex.gz *.blg *.log'

#alias fn='firefox -new-window % &


function fn {
    firefox -new-window $1 &
}


alias bf='python ~/research/disk-snowlines/src/models/bayessianFoo.py'

################################################################################
#                                GOTO Commands                                 #
################################################################################
export ggsl=~/research/scattered_light_water_absorption
export ggnsf=~/research/funding/nsf/2016
export ggw=~/research/disk-snowlines

alias pipe="cd ~/research/herschel/pythonScripts/pipeline"
alias ggnsf="cd $ggnsf"
alias ggsl="cd $ggsl"
alias ggw="cd $ggw"

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
