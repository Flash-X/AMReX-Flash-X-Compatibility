# Setup Flash-X
if [ -d "Flash-X" ]; then
	rm -rf Flash-X
fi

git clone git@github.com:Flash-X/Flash-X --branch main Flash-X && cd Flash-X
git submodule update --init --recursive
