# Set these first as some can affect subsequent calls
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

set -e
ulimit -S -c 1024000
ulimit -S -m 6144000
ulimit -S -v 6144000
umask 002

rm -rf $WORKSPACE/pyenv
python -m venv $WORKSPACE/pyenv
source $WORKSPACE/pyenv/bin/activate
pip install wheel
pip install git+https://github.com/Flash-X/Flash-X-Test.git@main
pip install git+https://github.com/Lab-Notebooks/Jobrunner.git@development
