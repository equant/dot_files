#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:~/bin/:~/bin/my_bash_tools:~/bin/casa/bin
export LD_LIBRARY_PATH=/home/equant/lib

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ll='ls -l --color=auto'
alias lt='ls -ltr'

alias rmtex='rm *.bbl *.aux msNotes.bib *.synctex.gz *.blg *.log'

#alias fn='firefox -new-window % &


function fn {
    firefox -new-window $1 &
}

################################################################################
#                                GOTO Commands                                 #
################################################################################
export ggsl=/home/equant/research/scattered_light_water_absorption
export ggnsf=/home/equant/research/funding/nsf/2016
export ggw=/home/equant/research/disk-snowlines

alias pipe="cd /home/equant/research/herschel/pythonScripts/pipeline"
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

################################################################################
#                            External Bash Scripts                             #
################################################################################
. ~/bin/my_bash_tools/pdf_search.bash

################################################################################
#                                  Dead Wood                                   #
################################################################################
#alias mkdb='mkdir -p backups/$(date +%Y%m%d)'
#alias prop='cd /home/equant/research/alma/proposals/cycle-04/snow_line_vs_mass_accretion_rate'
#alias mcprog='echo "Running..." ; ps aux | grep -i MCMaxLinux | wc -l; echo "Done..." ; ls -1 */done | wc -l'
#alias ljup='cd ~ ; jupyter notebook --certfile=.jupyter/mycert.pem --keyfile .jupyter/mykey.key'
