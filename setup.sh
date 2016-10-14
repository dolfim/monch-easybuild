
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

GROUP_EBPATH=/apps/monch/p501/RH6.7
SCRATCH_EBPATH=$SCRATCH/apps/
HOME_EBPATH=$HOME/apps/eb_$hostName

if [ -z "$1" ]; then
    echo "You have to pass the PREFIX as argument. You can select one of the standard paths below or quit."
    PS3="Select a PREFIX path: "
    options=("$SCRATCH_EBPATH" "$HOME_EBPATH" "$GROUP_EBPATH" "Quit")
    select opt in "${options[@]}"; do 
        case "$REPLY" in
    
        1 ) PROJ=$SCRATCH_EBPATH; break;;
        2 ) PROJ=$HOME_EBPATH; break;;
        3 ) PROJ=$GROUP_EBPATH; break;;
        4 ) return ;;
        q ) return ;;
    
        *) echo "Invalid option. Try another one.";continue;;
    
        esac
    done
else
    PROJ=$1
fi

REPO_ROOT=$(dirname $(readlink -f $BASH_SOURCE))


source /apps/common/UES/easybuild/setup.sh $PROJ

export EASYBUILD_SOURCEPATH=$HOME/src
export EASYBUILD_ROBOT_PATHS="$REPO_ROOT/easyconfigs/:$EASYBUILD_ROBOT_PATHS:"
export EASYBUILD_INCLUDE_EASYBLOCKS=$REPO_ROOT'/easyblocks/*py,'$EASYBUILD_INCLUDE_EASYBLOCKS

## Use the group paths
#module use /apps/monch/UES/RH6.7-16.04/easybuild/modules/all
module use $GROUP_EBPATH/easybuild/modules/all
# for slurm module:
module use /apps/monch/UES/modulefiles/

