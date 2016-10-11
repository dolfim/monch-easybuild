# EasyBuild scripts for Mönch

This repository provides custom EasyBuild configs which extend what is available in the official repository as well as the CSCS repos.

## Using the modules

To use the modules compiled with EasyBuild you have to invoke a few commands.

```bash
## For the modules maintained by CSCS
module use /apps/monch/UES/RH6.7-16.04/easybuild/modules/all
## For the modules maintained insided the group
module use /apps/monch/p501/RH6.7/easybuild/modules/all
```

If you have custom installed modules in your home:
```bash
module use $HOME/apps/eb_monch/easybuild/modules/all
```

## Develop modules

To build new modules you need to load EasyBuild. Additional variables have to be loaded, in order to have EasyBuild recognazing the configurations in this repository.

For convenience we setup a script which loads the build environment for your:

```bash
source ./setup.sh
```

### Build a new module and its depencies
Note: Dependencies will be found only if the follow the standard EasyBuild naming convention.


```bash
eb path/to/config.eb --parallel=12 -r -k -D    # dry-run
```

* ```-k```: build dependencies
* ```-r```: for for dependencies in the standard path
* ```-D```: dry run.
* ```--parallel=X```: build in parallel with X processes. The number will be passed to *make* as the *-j* option.

