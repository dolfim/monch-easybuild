
# Retrieve host name (excluding node number)
if [[ -z $hostName ]] ; then
    hostName=${HOSTNAME//[0-9]/}
fi
# Special case for monch (compute nodes append "c" to the hostname) 
if [[ $hostName =~ ^monch  ]]; then
        hostName=monch
fi

## repo for installed software
# Not needed, since CSCS setup will save in directory
#export EASYBUILD_REPOSITORYPATH="git@git.comp.phys.ethz.ch:codes/monch-easybuild.git,ebfiles_repo/"$hostName

if [ -z "$1" ]; then
    echo "You have to pass the PREFIX as argument"
    return
fi

REPO_ROOT=$(dirname $(readlink -f $BASH_SOURCE))
PROJ=$1

source /apps/common/UES/easybuild/setup.sh $PROJ

export EASYBUILD_SOURCEPATH=$HOME/src
export EASYBUILD_ROBOT_PATHS="$REPO_ROOT/easyconfigs/:$EASYBUILD_ROBOT_PATHS:"
export EASYBUILD_INCLUDE_EASYBLOCKS="$REPO_ROOT/easyblocks/*py $EASYBUILD_INCLUDE_EASYBLOCKS"
