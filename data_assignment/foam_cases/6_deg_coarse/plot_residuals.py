import os
import sys
import numpy as np
from time import sleep
import matplotlib.pyplot as plt

def plot_data_n_iter(filepath, save):
    filepath+="/solverInfo.dat"
    time = np.genfromtxt(filepath, skip_header=2, usecols=(0))
    ux = np.genfromtxt(filepath, skip_header=2, usecols=(3))
    uy = np.genfromtxt(filepath, skip_header=2, usecols=(6))
    p = np.genfromtxt(filepath, skip_header=2, usecols=(11))
    n_iter = time[:-1].size
    plt.plot(range(n_iter), ux[:time.size-1], label="$U_x$", alpha=0.5)
    plt.plot(range(n_iter), uy[:time.size-1], label="$U_y$", alpha=0.5)
    plt.plot(range(n_iter), p[:time.size-1], label="$P$", alpha=0.5)
    plt.grid()
    plt.xlabel("Iteration")
    plt.ylabel("Residual")
    plt.yscale("log")
    plt.legend()
    plt.tight_layout()
    if save:
        plt.savefig("residual_plot_iter.png")
        exit()
    plt.show()


def plot_data_time(filepath, save):
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
        plt.savefig("residual_plot_time.png")
        exit()
    plt.show()
    

root = "./postProcessing/solverInfo" 
dirs = [float(i) for i in os.listdir(root)]
dirs.sort()
dirs = [str(i) for i in dirs]


save = False
loop = False
plot_data = plot_data_time
if "-h" in sys.argv or "--help" in sys.argv:
    print("-h, --help for help")
    print("-s to save the plot. Does not show plot")
    print(f"-c to choose folders to plot from. If not provided, default is the most recently modified file in {root}")
    print("-r to refresh every 2 seconds")
    print("-n to plot residuals vs iteration as opposed to time")
    exit()

if "-n" in sys.argv:
    plot_data = plot_data_n_iter

if "-s" in sys.argv:
    save = True

if "-r" in sys.argv:
    loop = True
    
if "-c" in sys.argv:
    print(dirs)
    for i, directory in enumerate(dirs):
        print(f"{i}: {directory}")
    idx = input("Enter the index from the file you want: ")
    dir_plt = dirs[idx]
    print(f"plotting data in {dir_plt}")
else:
    dir_plt = dirs[-1]
    print(f"defaulting to newest folder {dir_plt}")

if not loop:
    try:
        plot_data(root+ "/" + dir_plt, save)
    except OSError:
        plot_data(root+ "/" + dir_plt[:-2], save)
else:
    i = 0
    while True:
        try:
            plot_data(root+ "/" + dir_plt, save)
        except OSError:
            plot_data(root+ "/" + dir_plt[:-2], save)
        i +=1
        if i> 10:
            print("breaking just in case :)")
            break
        
