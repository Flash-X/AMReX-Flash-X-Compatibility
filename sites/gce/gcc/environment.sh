##-- Hardcoded
# Location of official Flash-X project
export FLASHX_PROJECT_PATH=/nfs/gce/projects/FLASH5

# Set these first as some can affect subsequent calls
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

ulimit -S -c 1024000
ulimit -S -m 6144000
ulimit -S -v 6144000
umask 002

# Install Flash-X-Test command line tools for use by user with system python.
# Setup our own dedicated python virtual env so that it is minimal and 
# avoids possible conflicts with other Jenkins jobs that use same python.
#
# Using system python as base.
#
# Few packages are installed with this and these are fairly common.
# Allow for the latest versions of these to be installed rather than
# fix a version.
rm -rf $WORKSPACE/pyenv
python -m venv $WORKSPACE/pyenv
source $WORKSPACE/pyenv/bin/activate
pip install wheel
pip install git+https://github.com/Flash-X/Flash-X-Test.git@main
pip install pyjobrunner

# Setup LMod to use Flash-X-specific modules
#
# Use the modulefiles in the official test env clone in the Flash-X project
# folder rather than the clone made by Jenkins since these are the files
# close to the Spack installation.  By doing this, we alleviate the issue of
# making sure that all modulefiles (including symbolic links to modulefiles
# in the Spack installation) contain *only* absolute paths.
#
# This is also clean in the sense that users who want to use the software
# stack in GCE to test/debug will be using the exact same setup.
module use $FLASHX_PROJECT_PATH/FlashXTestEnv/gce/software/custom/linux-ubuntu20.04-skylake/modulefiles
module purge && module load FlashX-TestEnv-intel

# Set path to local and main archive for Flash-X-Test
export FLASHXTEST_LOCAL_ARCHIVE=$FLASHX_PROJECT_PATH/FlashXTestArchive/localArchive/amrex_gcc
export FLASHXTEST_MAIN_ARCHIVE=$FLASHX_PROJECT_PATH/FlashXTestArchive/mainArchive/amrex_gcc
