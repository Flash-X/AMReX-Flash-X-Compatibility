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

# Load module path for FlashX-TestEnv
module use $FLASHX_PROJECT_PATH/FlashXTestEnv/gce/software/custom/linux-ubuntu20.04-skylake/modulefiles
module purge && module load FlashX-TestEnv-gcc

# Set MPI_HOME by quering path loaded by site module
export MPI_HOME=$(which mpicc | sed s/'\/bin\/mpicc'//)

# Path to parallel HDF5 installtion with fortran support
export HDF5_HOME=$(which h5pfc | sed s/'\/bin\/h5pfc'//)

# Path to flashxtest
export FLASHXTEST_PATH=$(which flashxtest | sed s/'\/flashxtest'//)

# Set path to local and main archive for Flash-X-Test
export FLASHTEST_OUTPUT_DIR=$FLASHX_PROJECT_PATH/flashTestRuns/amrex_gcc
export FLASHTEST_LOCAL_ARCHIVE=$FLASHX_PROJECT_PATH/FlashXTestArchive/localArchive/amrex_gcc
export FLASHTEST_MAIN_ARCHIVE=$FLASHX_PROJECT_PATH/FlashXTestArchive/mainArchive/amrex_gcc
