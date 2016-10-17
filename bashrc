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

################################################################################
#                                GOTO Commands                                 #
################################################################################
alias gen='cd /data/2015-brown_dwarf-disk_mass/radiativeTransferModels/genetic_results/'
alias pipe='cd /home/equant/research/herschel/pythonScripts/pipeline'
alias gnsf='cd /home/equant/research/funding/2016/nsf'

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
#                                     Misc                                     #
################################################################################
alias mcprog='echo "Running..." ; ps aux | grep -i MCMaxLinux | wc -l; echo "Done..." ; ls -1 */done | wc -l'
alias ljup='cd ~ ; jupyter notebook --certfile=.jupyter/mycert.pem --keyfile .jupyter/mykey.key'

################################################################################
#                            External Bash Scripts                             #
################################################################################
. ~/bin/my_bash_tools/pdf_search.bash

################################################################################
#                                  Dead Wood                                   #
################################################################################
#alias mkdb='mkdir -p backups/$(date +%Y%m%d)'
#alias prop='cd /home/equant/research/alma/proposals/cycle-04/snow_line_vs_mass_accretion_rate'
