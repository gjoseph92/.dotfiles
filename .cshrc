# @(#)Cshrc 1.1 86/01/06 SMI; 
#################################################################
#
#         .cshrc file
#
#         initial setups for both interactive and noninteractive
#         C-Shells
#
#################################################################

#       If executing the normal C-shell, still read system-wide init file
 
if ($?SHELL != 0) then
    if ($SHELL == /bin/csh && -r /etc/csh.cshrc) source /etc/csh.cshrc
endif

# Set default file protection off limits to others
umask 077

# Exit this script if this is not an interactive shell
if ($?USER == 0 || $?prompt == 0) exit

# Enable shell histories
set history=50
set savehist=50

# Enable filename completion in case you use csh instead of default tcsh
# (the ESCAPE key will try to finish file names)
set filec

# Limit core dumps to something reasonable (3 Megabytes) just to avoid
#	accidentally creating huge useless files.
limit coredumpsize 3m

# To allow control-D for logout, comment out the following line.
set ignoreeof

# Use a prompt like presto{bjones}1:
if ("$prompt" == "> " || "$prompt" == "% ") then
	set host = `echo linux`
#	if ( $host == "mezzo" || $host == "conbrio" ) then
#		set prompt="andante{`whoami`}\!: "
#	else
		set prompt="$host{`whoami`}\!: "
#	endif
endif

# To shorten some common commands, un-comment the following lines.

# alias a        alias
# alias h        history
# alias m        more

# figure out operating system from uname command
#set opsys = `/bin/uname -s`
# (doesn't work on Red Hat)

# Sun Microsystems Special initialization
if ($opsys == 'SunOs') then 
    # execute these commands on all SunOS systems: 
    # disable job control :  comment out these two lines to enable it. 
    stty susp undef
    stty dsusp undef

# Silicon Graphics Special initialization
else if ($opsys == 'IRIX') then
    # execute these commands on ALL IRIX systems:
    if (`/usr/bin/uname -r | /usr/bin/awk -F. '{print $1}'` >=6) then
	# execute these commands on IRIX 6.x systems and above: 
	# disable job control :  comment out these two lines to enable it. 
	stty susp undef
	stty dsusp undef
    else 
	# execute these commands on IRIX 5.x systems and below: 
	# disable job control :  comment out these two lines to enable it. 
	stty susp ^
	stty dsusp ^
    endif

# Dec Alpha Special initialization
else if ($opsys == 'OSF1') then
    # execute these commands on ALL OSF/1 systems: 
    # disable job control :  comment out these two lines to enable it. 
    stty susp undef
    stty dsusp undef

# Dec MIPS Special initialization
else if ($opsys == 'ULTRIX') then
   # execute these commands on ALL ULTRIX systems: 
    # disable job control :  comment out these two lines to enable it. 
   stty susp undef
   stty dsusp undef
endif

unset opsys
# added prompt by set_prompt on Thu Sep 22 11:10:40 EDT 2011
set prompt = '%~ > ' 
