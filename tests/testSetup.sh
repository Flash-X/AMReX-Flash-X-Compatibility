# Initialiaze Flash-X testing environment by first creating a temprorary site in the Flash-X site folder
TestSiteName=amrex.flashx && mkdir -pv $FLASHX_HOME/sites/$TestSiteName

# Link makefiles to use the makefile from current site directory
ln -sf $SiteHome/Makefile.h $FLASHX_HOME/sites/$TestSiteName/Makefile.h

# Initialize config and execfile
flashxtest init -z $FLASHX_HOME -s $TestSiteName \
	-mpi=mpirun -make="make -j" $FLASHXTEST_SETUP_OPTS

# Initialiaze Flash-X test suite
flashxtest setup-suite --overwrite $SiteHome/Tests.suite
