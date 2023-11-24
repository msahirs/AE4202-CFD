#!/bin/sh

# get mesh
gmshToFoam ../../airfoil_geometry/coarse_mesh/structured_four.msh

# fix BCs
changeDictionary

restore0Dir

# renumberMesh
renumberMesh -overwrite -constant

# map initial conditions
mapFields -consistent ../results/init_conditions/ -sourceTime 'latestTime'


