# Initialiaze Flash-X testing environment by first creating a temprorary site in the Flash-X site folder
mkdir -pv $FLASHX_HOME/sites/$FLASHXTEST_SITENAME

# Link makefiles to use the makefile from current site directory
ln -sf $SiteHome/Makefile.h $FLASHX_HOME/sites/$FLASHXTEST_SITENAME/Makefile.h

# Initialize config and execfile
flashxtest init -z $FLASHX_HOME -s $FLASHXTEST_SITENAME -make "make -j" $FLASHXTEST_SETUP_OPTS

# Initialiaze Flash-X test suite
flashxtest setup-suite --overwrite $SiteHome/Tests.suite
