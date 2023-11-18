#!/bin/sh
cd "${0%/*}" || exit                                # Run from this directory
. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions        # Tutorial run functions
#------------------------------------------------------------------------------

# check if directories are clear, recommend purge, abort
if [ -d "./postProcessing" ]; then
    echo "./postProcessing still exists"
    if [ -d "./processor0" ]; then
        echo "Decomposed stuff still exists"
    fi
    while true; do
    read -p "run reset script? (y / n)" response
    case $response in
        [Yy]*) ./reset.sh; break;;
        [Nn]*) echo "Aborting"; exit ;;
        * ) echo "enter y or n.";;
    esac
    done
fi

runParallel -s decompose \
    redistributePar -decompose -overwrite -withZero

runParallel $(getApplication)

# move new fvSchemes, fvSolution, controlDict
echo "moving in second order fvSchemes, fvSolution and controlDict"
rm ./system/fvSchemes
rm ./system/fvSolution
rm ./system/controlDict
cp ./system/second_order/* ./system/

mv ./log.rhoPimpleFoam ./log.rhoPimpleFoam_coarse

runParallel $(getApplication)

mv ./log.rhoPimpleFoam ./log.rhoPimpleFoam_fine

runParallel -s reconstruct \
    redistributePar -reconstruct -overwrite

./compute_yPlus.sh

# ------------------------------------------------------------------------------
