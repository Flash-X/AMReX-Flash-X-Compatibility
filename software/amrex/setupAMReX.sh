# Bash script for `jobrunner` to install AMReX

# Setup AMReX
if [ -d "AMReX" ]; then
	rm -rf AMReX
fi

# Clone a fresh copy for building and testing
if [[ $GitConnection == "SSH" ]]; then
	git clone git@github.com:AMReX-Codes/amrex --branch 23.11 AMReX && cd AMReX
elif [[ $GitConnection == "HTTPS" ]]; then
	git clone https://github.com/AMReX-Codes/amrex.git --branch 23.11 AMReX && cd AMReX
else
	exit 1
fi

# configure and install amrex in 1D
make clean || true
BITTREE_HOME=$BITTREE_1D_HOME
./configure --dim=1 --prefix=$AMREX1D_HOME --enable-bittree=yes --enable-tiny-profile=yes --debug=no
make -j
make install

# configure and install amrex in 2D
make clean || true
BITTREE_HOME=$BITTREE_2D_HOME
./configure --dim=2 --prefix=$AMREX2D_HOME --enable-bittree=yes --enable-tiny-profile=yes --debug=no
make -j
make install

# configure and install amrex in 3D
make clean || true
BITTREE_HOME=$BITTREE_3D_HOME
./configure --dim=3 --prefix=$AMREX3D_HOME --enable-bittree=yes --enable-tiny-profile=yes --debug=no
make -j
make install
