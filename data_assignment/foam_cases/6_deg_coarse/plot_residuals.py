import os
import sys
import numpy as np
import matplotlib.pyplot as plt

def plot_data(filepath, save):
    filepath+="/solverInfo.dat"
    time = np.genfromtxt(filepath, skip_header=2, usecols=(0))
    ux = np.genfromtxt(filepath, skip_header=2, usecols=(3))
    uy = np.genfromtxt(filepath, skip_header=2, usecols=(6))
    p = np.genfromtxt(filepath, skip_header=2, usecols=(11))
    plt.plot(time[:-1], ux[:time.size-1], label="$U_x$", alpha=0.5)
    plt.plot(time[:-1], uy[:time.size-1], label="$U_y$", alpha=0.5)
    plt.plot(time[:-1], p[:time.size-1], label="$P$", alpha=0.5)
    plt.grid()
    plt.xlabel("Time [s]")
    plt.ylabel("Residual")
    plt.yscale("log")
    plt.legend()
    plt.tight_layout()
    if save:
        plt.savefig("residual_plot.png")
        exit()
    plt.show()
    

root = "./postProcessing/solverInfo" 
dirs = [float(i) for i in os.listdir(root)]
dirs.sort()
dirs = [str(i) for i in dirs]


save = False
if "-h" in sys.argv or "--help" in sys.argv:
    print("-h, --help for help")
    print("-s to save the plot. Does not show plot")
    print(f"-c to choose folders to plot from. If not provided, default is the most recently modified file in {root}")
    exit()

if "-s" in sys.argv:
    save = True

if "-c" in sys.argv:
    print(dirs)
    for i, directory in enumerate(dirs):
        print(f"{i}: {directory}")
    idx = input("Enter the index from the file you want: ")
    print(f"plotting data in {dirs[idx]}")
    plot_data(root+ "/" + dirs[i], save)
else:
    default = dirs[-1]
    print(f"defaulting to newest folder {default}")
    plot_data(root+ "/" + default, save)
