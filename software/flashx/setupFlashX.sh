# Setup Flash-X
if [ -d "Flash-X" ]; then
	rm -rf Flash-X
fi

# Clone a fresh copy for building and testing
if [[ $GitConnection == "SSH" ]]; then
	git clone git@github.com:Flash-X/Flash-X --branch staged Flash-X && cd Flash-X
elif [[ $GitConnection == "HTTPS" ]]; then
	git clone https://github.com/Flash-X/Flash-X.git --branch staged Flash-X && cd Flash-X
else
	exit 1
fi

git submodule update --init --recursive
