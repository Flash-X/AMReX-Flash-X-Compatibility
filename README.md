## Compatibility Testing Environment for Flash-X + AMReX

1. `pip3 install -r requitements.txt`

2. Create a new directory under `sites` similar to `sites/sedona` and 
   customize your `environment.sh` and `Makefile.h`

3. `./configure -s <your-site-name>`

4. `./run_compatibility_tests`

Initial test runs will fail and the baselines will have to be set manually following instructions here:

https://github.com/Flash-X/Flash-X-Test/tree/main/FlashXTest/example

To set benchmarks `-cbase <yyyy-mm-dd> -rbase <yyyy-mm-dd>` to your first and second run.
