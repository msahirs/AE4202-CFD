# Notes
 
 - `/input_geometry` contains the fixed airofil coordinates in `.geo` and `.dat` formats. if you're creating a **gmsh** file, just use an include statement. **do not** copy paste the contents
 
 - `/first_try` contains Sahir's first itration of mesh creation without much thought. don't use it cause it's broke, but provides nice reference and at least the structure bit works. it also helped me figure out an issue with the airfoil and flap data points the prof gave us lmao

 - The sub-directories do contain openfoam case files solely for `gmshtoFoam` command usage to work

 - Remember to actually generate the gmsh `.msh` file before using `gmshtoFoam` on it (and have your OpenFOAM environment activated)
