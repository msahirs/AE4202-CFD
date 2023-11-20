#!/bin/sh
cd "${0%/*}" || exit                                # Run from this directory
. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions        # Tutorial run functions
#------------------------------------------------------------------------------

echo "Deleting individual timesteps"
foamListTimes -rm

echo "Deleting postProcessing"
rm ./postProcessing -rf

echo "Deleting decomposition"
rm ./processor* -rf

echo "Purging logs"
rm ./log.*

echo "Resetting fvSchemes, fvSolution and controlDict"
rm ./system/fvSchemes
rm ./system/fvSolution
rm ./system/controlDict
cp ./system/first_order_start/* ./system/

echo "Restoring 0"
restore0Dir

echo "renumbering"
renumberMesh -overwrite -constant
