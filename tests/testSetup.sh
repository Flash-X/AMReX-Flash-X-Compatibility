# Initialiaze Flash-X testing environment by first creating a temprorary site in the Flash-X site folder
TestSiteName=$SiteName && mkdir -pv $FLASHX_HOME/sites/$TestSiteName

# Link makefiles to use the makefile from current site directory
ln -sf $SiteHome/Makefile.h $FLASHX_HOME/sites/$TestSiteName/Makefile.h

# Check it test output directory is in working directory, otherwise perform a symbolic link
if [ $FLASHTEST_OUTPUT_DIR != "$PROJECT_HOME/tests/TestResults" ]; then
	mkdir -pv $PROJECT_HOME/tests/TestResults
	ln -s $FLASHTEST_OUTPUT_DIR $PROJECT_HOME/tests/TestResults
fi

# Initialize config and execfile
flashxtest init -z $FLASHX_HOME \
	-s $TestSiteName -m $FLASHTEST_MAIN_ARCHIVE \
        -o $FLASHTEST_OUTPUT_DIR \
	-a $FLASHTEST_LOCAL_ARCHIVE -mpi=mpirun -make="make -j"

# Initialiaze Flash-X test suite
flashxtest setup-suite --overwrite $SiteHome/Tests.suite
