## Compatibility Testing Environment for Flash-X + AMReX

1. `pip3 install -r requitements.txt`

2. Create a new directory `sites/<your-site>` similar to `sites/sedona` and 
   customize your `environment.sh` and `Makefile.h`

3. Copy `sites/sedona/Tests.suite` to `sites/<your-site>/Tests.suite`

4. Run `flashxtest remove-benchmarks sites/<your-site>/Tests.suite`. This command will remove benchmarks from another site

3. `./configure -s <your-site-name>`

4. `./run-compatibility-tests`

5. Initial test runs will fail and the baselines will have to be set manually.

6. Run `flashxtest add-cbase <yyyy-mm-dd>`.

7. `./run-compatibility-tests` again.

8. Run `flashxtest add-rbase <yyyy-mm-dd>_2`.

9. `./run-compatibility-tests`

SUCCESS 
