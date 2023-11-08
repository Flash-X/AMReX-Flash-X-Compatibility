# Bash script for `jobrunner` to install Bittree

# If Bittree already present in working directory then delete it
if [ -d "Bittree" ]; then
	rm -rf Bittree
fi

# Clone a fresh copy for building and testing
git clone git@github.com:Flash-X/Bittree.git --branch main && cd Bittree

# configure and install
python3 setup.py library --dim 2 --prefix $BITTREE_2D_HOME
cd build && make && make install && cd ..

python3 setup.py library --dim 3 --prefix $BITTREE_3D_HOME
cd build && make && make install && cd ..
