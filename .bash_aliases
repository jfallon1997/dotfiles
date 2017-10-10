# list of bash aliases

# assume that 'sl' is a typo
alias sl='ls'

# open files/folders with appropriate software
open(){ xdg-open "$@" & }

# use trash instead of rm (can still call /bin/rm...)
alias rm='echo "rm disabled, try using trash or /bin/rm"'

md2html(){ pandoc "$@" -s -o /tmp/pandoc.html && open /tmp/pandoc.html & }

# routine maintenance 
alias mntn='sudo apt update; sudo apt upgrade; echo "Starting clamscan of /home/james" ; clamscan --recursive=yes --infected /home/james'
