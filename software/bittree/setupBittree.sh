# Bash script for `jobrunner` to install Bittree

# If Bittree already present in working directory then delete it
if [ -d "Bittree" ]; then
	rm -rf Bittree
fi

# Clone a fresh copy for building and testing
if [[ $GitConnection == "SSH" ]]; then
	git clone git@github.com:Flash-X/Bittree.git --branch main && cd Bittree
elif [[ $GitConnection == "HTTPS" ]]; then
	git clone https://github.com/Flash-X/Bittree.git --branch main Bittree && cd Bittree
else
	exit 1
fi

# configure and install
python3 setup.py library --dim 1 --prefix $BITTREE_1D_HOME
cd build && make && make install && cd ..

python3 setup.py library --dim 2 --prefix $BITTREE_2D_HOME
cd build && make && make install && cd ..

python3 setup.py library --dim 3 --prefix $BITTREE_3D_HOME
cd build && make && make install && cd ..
