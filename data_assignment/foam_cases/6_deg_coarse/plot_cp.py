import os
import sys
import numpy as np
import matplotlib.pyplot as plt

def plot_reference_data():
    path = "../../reference_experimental_data/"
    current = os.getcwd().split("/")[-1]
    if "13_deg" in current:
        flap_file = path + "cp_flap_13.dat"
        wing_file = path + "cp_wing_13.dat"
        angle = 13
    elif "6_deg" in current:
        flap_file = path + "cp_flap_6.dat"
        wing_file = path + "cp_wing_6.dat"
        angle = 6
    else:
        raise OSError(f"current file name should have '6deg' or '13_1deg' in it. \n {current} does not.") 
    
    # first column is x/c, second column is Cp
    flap_data = np.genfromtxt(fname=flap_file, skip_header=2)
    foil_data = np.genfromtxt(fname=wing_file, skip_header=2)
    fig, (wing_ax, flap_ax) = plt.subplots(1, 2)
    wing_ax.plot(foil_data[:, 0], foil_data[:, 1], label ="Reference")
    wing_ax.set_title("Wing Pressure Coefficient")
    wing_ax.set_xlabel("x/c")
    wing_ax.set_ylabel("$C_p$")
    wing_ax.grid()
    flap_ax.plot(flap_data[:, 0], flap_data[:, 1], label="Reference")
    flap_ax.set_title("Flap Pressure Coefficient")
    flap_ax.set_xlabel("x/c")
    flap_ax.set_ylabel("$C_p$")
    flap_ax.grid()
    fig.tight_layout()
    return fig, wing_ax, flap_ax
    

def plot_cfd_data(fig, wing_ax, flap_ax, wing_data, flap_data):
    wing_ax.scatter(wing_data[0], wing_data[1], label="CFD", marker="*")
    wing_ax.legend()
    flap_ax.scatter(flap_data[0], flap_data[1], label="CFD", marker="*")
    flap_ax.legend()
    
    
def process_foam_surface_file(file_path, n_to_avg, return_x=False):
    press = np.genfromtxt(fname=file_path, skip_header=2, usecols=(3))/n_to_avg
    if return_x and "flap" in file_path:
        flap_x = np.genfromtxt(fname=file_path, skip_header=2, usecols=(0))
        flap_x -= min(flap_x)
        return flap_x / (max(flap_x)/0.3167), press
    elif return_x:
        wing_x = np.genfromtxt(fname=file_path, skip_header=2, usecols=(0))
        return wing_x / (max(wing_x)/0.9286), press
    return press


def get_cfd_data(surface_dir, n_steps_to_avg, flap_file, wing_file, p_inf, v_inf, rho_inf):
    dirs = [float(i) for i in os.listdir(surface_dir)]
    dirs.sort()
    try:
        dirs = [str(i) for i in dirs[-n_steps_to_avg:]]
    except IndexError:
        print(f"Trying to average over too many values ({n_steps_to_avg}, defaulting to 200")
        dirs = [str(i) for i in dirs[-n_steps_to_avg:]]
    flap_x, flap_press = process_foam_surface_file(surface_dir + dirs[0] + "/" + flap_file, n_steps_to_avg, True)
    wing_x, wing_press = process_foam_surface_file(surface_dir + dirs[0] + "/" + wing_file,
                                                         n_steps_to_avg, True)
    print(dirs)
    for directory in dirs[1:]:
        flap_press += process_foam_surface_file(surface_dir + directory + "/" + flap_file, n_steps_to_avg)
        wing_press += process_foam_surface_file(surface_dir + directory + "/" + wing_file, n_steps_to_avg)

    wing_press = (wing_press - p_inf) / (0.5 * rho_inf * v_inf * v_inf)
    flap_press = (flap_press - p_inf) / (0.5 * rho_inf * v_inf * v_inf)
    return np.vstack((wing_x, wing_press)), np.vstack((flap_x, flap_press))


n_avg_steps = 5000
press_dir = "./postProcessing/surfaces/"

if "-h" in sys.argv or "--help" in sys.argv:
    print("-h, --help for help")
    print(f"-s to save the plot. Does not show plot")
    print(f"add an arbitraty integer to average over that many timesteps. Default is {n_steps} steps. The first integer provided is used.")
    exit()
    
for i in sys.argv:
    try: 
        int(i)
        n_avg_steps = int(i)
        print(f"using {n_steps} steps to average")
    except:
        pass

wing_data, flap_data = get_cfd_data(press_dir, n_avg_steps, "p_flap.raw", "p_airfoil.raw", 101325, 0.185 * (287*293*1.4)**0.5, 101325/287/293)
fig, wing_ax, flap_ax = plot_reference_data()
plot_cfd_data(fig, wing_ax, flap_ax, wing_data, flap_data)

if "-s" in sys.argv:
    plt.savefig("cp_plot.png")
    exit()
plt.show()

