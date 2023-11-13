# cache the value of current working directory
NodeDir=$(realpath .)

cd $PROJECT_HOME/software/flashx/Flash-X && echo Flash-X HEAD is at $(git rev-parse --short HEAD)
cd $PROJECT_HOME/software/amrex/AMReX && echo AMReX HEAD is at $(git rev-parse --short HEAD)
cd $PROJECT_HOME/software/bittree/Bittree && echo Bittree HEAD is at $(git rev-parse --short HEAD)

# Run Flash-X test suite
cd $NodeDir && flashxtest run-suite --archive $FLASHXTEST_RUN_OPTS
