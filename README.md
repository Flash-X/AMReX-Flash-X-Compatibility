# Compatibility Testing Environment for Flash-X + AMReX

This execution evironment is designed to verify compatbility of Flash-X staged branch with the development branch/desired tag of AMReX. The environment can be configured on any platform by specifying site specific files for building and testing. At present we use this environment in the following Jenkins workflow: https://jenkins-gce.cels.anl.gov/job/Flash-X-amrex_GCC, which is run as a part of the Flash-X testing workflow.

## Steps to setup this environment for your local testing

If you are looking to learn about the mechanics of Flash-X's testing framework, Flash-X-Test, we recommend following the example provided here: https://github.com/Flash-X/Flash-X-Test/tree/main/FlashXTest/example. The corresponding README for the testing framework is located in the same repository. 

Steps described below only pertain to setting up an AMReX + Flash-X testsuite to ensure comptability between their development.

1. The file ``requirements.txt`` provides the python packages that should be installed to make this testsuite work.
   You can install this directly using pip or by creating a special script like ``sites/gce/pyenv.sh``.

2. Next, you need to create a new directory `sites/<your-site>` similar to `sites/sedona` or `sites/gce` and 
   customize your `environment.sh` and `Makefile.h`.

3. You can copy `sites/sedona/Tests.suite` or `sites/gce/gcc/Tests.suite` to `sites/<your-site>/Tests.suite` depending on the
   level of coverage you desire for your local testsuite. You can also pick/design your own tests by describing them under
   ``tests/tests.yaml`` in Flash-X ``Simulation/SimulationMain/<simulation-name>`` directory.

4. Run `flashxtest remove-benchmarks sites/<your-site>/Tests.suite`. This command will remove benchmarks from another site,
   you can also add the option ``--strip-comments`` to remove comments from a copied Tests.suite.

5. Run the configure script with your site name and desired options,
   `./configure -s <your-site-name> -git <https-or-ssh> -amrex <amrex-branch-or-tag>`

6. Then run `./run-compatibility-tests`. If everything is setup correctly your testsuite will start without any issues. If
   issues occur resolve them. You can always reach out to Flash-X developers or file an issue on this repository incase you
   need help.

7. Initial test runs will fail and the baselines will have to be set manually.

8. Run `flashxtest add-cbase sites/<your-site>/Tests.suite <yyyy-mm-dd>`.

9. `./run-compatibility-tests` again.

10. Run `flashxtest add-rbase sites/<your-site>/Tests.suite <yyyy-mm-dd>_2`.

11. `./run-compatibility-tests`

SUCCESS

Now you can run this testsuite anytime you would like to check comptability of AMReX version with Flash-X

## Note on various Python tools used

This execution environment uses Flash-X-Test to perform testing for Flash-X source code. And the orgnization of the notebook is implemented using Jobrunner (https://github.com/Lab-Notebooks/Jobrunner).

If you are interested in learning more about the tools we recommend reading our papers here:

- https://arxiv.org/pdf/2308.16180.pdf
- https://arxiv.org/pdf/2308.15637.pdf
