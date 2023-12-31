# Bash file to load modules and set environment
# variables for compilers and external libraries

# Set project home using realpath
# of current directory
export PROJECT_HOME=$(realpath .)

# Set SiteHome to realpath of SiteName
SiteHome="$PROJECT_HOME/sites/$SiteName"

# Load modules from the site directory
source $SiteHome/environment.sh

# Check if path to parallel HDF5 installation exists
if ! [ $HDF5_HOME ]; then
	echo "HDF5_HOME not set"
	exit 1
fi

# Check if path to MPI installation exists
if ! [ $MPI_HOME ]; then
	echo "MPI_HOME not set"
	exit 1
fi

# Check if path to MPI installation exists
if ! [ $FLASHXTEST_PATH ]; then
	echo "FLASHXTEST_PATH not set"
	exit 1
fi

# Store path to bittree
export BITTREE_1D_HOME="$PROJECT_HOME/software/bittree/Bittree/install-$SiteName/1D"
export BITTREE_2D_HOME="$PROJECT_HOME/software/bittree/Bittree/install-$SiteName/2D"
export BITTREE_3D_HOME="$PROJECT_HOME/software/bittree/Bittree/install-$SiteName/3D"

# Store path to amrex as environment variable
export AMREX1D_HOME="$PROJECT_HOME/software/amrex/AMReX/install-$SiteName/1D"
export AMREX2D_HOME="$PROJECT_HOME/software/amrex/AMReX/install-$SiteName/2D"
export AMREX3D_HOME="$PROJECT_HOME/software/amrex/AMReX/install-$SiteName/3D"

# Path to Flash-X
export FLASHX_HOME="$PROJECT_HOME/software/flashx/Flash-X"

# Output information to stdout
echo "---------------------------------------------------------------------------------------"
echo "Execution Environment:"
echo "---------------------------------------------------------------------------------------"
echo "PROJECT_HOME=$PROJECT_HOME"
echo "SITE_HOME=$SiteHome"
echo "MPI_HOME=$MPI_HOME"
echo "HDF5_HOME=$HDF5_HOME"
echo "FLASHX_HOME=$FLASHX_HOME"
echo "AMREX1D_HOME=$AMREX1D_HOME"
echo "AMREX2D_HOME=$AMREX2D_HOME"
echo "AMREX3D_HOME=$AMREX3D_HOME"
echo "BITTREE_1D_HOME=$BITTREE_1D_HOME"
echo "BITTREE_2D_HOME=$BITTREE_2D_HOME"
echo "BITTREE_3D_HOME=$BITTREE_3D_HOME"
echo "FLASHXTEST_PATH=$FLASHXTEST_PATH"
echo "---------------------------------------------------------------------------------------"
