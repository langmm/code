# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Host specific options
isAccre=`echo $HOSTNAME | grep \.vampire`
if [ ! -z "$isAccre" ]; then
	# Do ACCRE setup here

	# User specific packages
	setpkgs -a perl
	setpkgs -a idl-8.0
	setpkgs -a gcc_compiler
	setpkgs -a intel_compiler
	setpkgs -a gsl_gcc
	setpkgs -a fftw2-mpich2_gcc_ether
	setpkgs -a mpich2_gcc_ether
	setpkgs -a matlab
	setpkgs -a hdf5

	# Paths
	export PATH=${PATH}:${HOME}/bin:/usr/lpp/mmfs/bin:/home/langmm/utils:/home/sinham/utils/idl
	export LD_LIBRARY_PATH=/usr/local/mpich2/latest/x86_64/gcc46/ether/lib:$LD_LIBRARY_PATH
	export LD_LIBRARY_PATH=/usr/local/gsl/latest/x86_64/gcc46/nonet/lib:$LD_LIBRARY_PATH
	export LD_LIBRARY_PATH=/usr/local/hdf5/1.8.8/x86_64/gcc4/nonet/lib:$LD_LIBRARY_PATH
#else
	# Do VPAC setup here
fi

# Allias'
#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
alias ll="ls -l --group-directories-first"
alias ls='ls -hFG'         # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias tree='tree -Csu'     # nice alternative to 'recursive ls'

#-------------------------------------------------------------
# To protect against accidental deletion
#-------------------------------------------------------------
alias waste='/bin/rm'
alias rm='mv $1 ~/.rm/'
alias emacy='emacs -nw'
alias git='ls /usr/local/git/bin/git'