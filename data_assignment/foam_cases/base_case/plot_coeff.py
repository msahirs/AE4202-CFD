import matplotlib.pyplot as plt
import numpy as np
import sys
import os

def read_data(filePath, coeffsToPlot):
    with open(filePath) as f:
        raw = f.readlines()[11:]
    coeffs = raw[1].replace("\t", "").split(" ")
    coeffs = list(filter(lambda x: x!="", coeffs))[1:-1]
    processed = []
    for line in raw[2:]:
        processed.append([float(entry) for entry in line.replace("\n", "").split("\t")])
    processed = np.array(processed)
    processed_data = {}
    if coeffsToPlot == "all":
        coeffsToPlot = coeffs[1:]
    for coeff in coeffsToPlot:
        try:
            processed_data[coeff] = processed[:, coeffs.index(coeff)]
        except ValueError:
            raise ValueError(f"Coefficient {coeff} not in list: {coeffs}")
        
    print("coeffs available:")
    print(coeffs)
    print(f"number of timesteps: {processed.shape[0]}")
    
    return processed[:, 0], processed_data


def plot_coeff_step(time, data, plot=None):
    if plot is None:
        fig = plt.figure()
    else:
        fig = plot
        plt.xlabel("Time [s]")
        plt.ylabel("Coefficient value")
        plt.grid()
        plt.legend()
        plt.tight_layout()
    for key in data.keys():
        plt.plot(time, data[key], label=key)

    return fig


def plot_reference_data(fig):
    current_angle = os.getcwd().split("/")[-1]    
#alpha  6 degrees
#cl       cd
#2.416   0.0229

#alpha   13.1 degrees
#cl       cd
#3.141   0.0445
    if "13_deg" in current_angle:
        plt.axhline(3.141, label="Ref Cl: 3.141", color="red")
        plt.axhline(0.0445, label="Ref Cd: 0.0445", color="black")
    elif "6_deg" in current_angle:
        plt.axhline(2.416, label="Ref Cl: 2.416", color="red")
        plt.axhline(0.0229, label="Ref Cd: 0.0229", color="black")
    plt.xlabel("Time [s]")
    plt.ylabel("Coefficient value")
    plt.grid()
    plt.legend()
    plt.tight_layout()
    return fig


def plot_avg(time, coeff_dict, n_steps):
    for key in coeff_dict.keys():
        avg = sum(coeff_dict[key][-n_steps:])/n_steps
        #print(sum(coeff_dict[key][-n_steps:]))
        #print(n_steps)
        #print(len(coeff_dict[key][-n_steps:]))
        #exit()
        plt.plot([time[-n_steps], time[-1]], [avg, avg], "--", label=f"{key} avg: {avg:.3f}")


def plot_coefficients(filepath, coeffs, save, n_steps):
    dirs = [float(i) for i in os.listdir(filepath)]
    dirs.sort()
    dirs = [str(i) for i in dirs]
    try:
        time, coeff_dict = read_data(filepath + "/0/coefficient_0.dat", coeffs)
    except FileNotFoundError:
        time, coeff_dict = read_data(filepath + "/0/coefficient.dat", coeffs)
    for directory in dirs[1:]:
        t, c = read_data(filepath + "/" + directory + "/coefficient.dat", coeffs)
        try: t, c = read_data(filepath + "/" + directory + "/coefficient.dat", coeffs)
        except FileNotFoundError:
            pass
        time = np.append(time, t)
        for coeff in coeff_dict:
            coeff_dict[coeff]  = np.append(coeff_dict[coeff], c[coeff])
    fig = plot_coeff_step(time, coeff_dict)
    try:
        fig = plot_avg(time, coeff_dict, n_steps)
    except:
        print(f"***** \n you're probably trying to average over to many values, n_avg is {n_steps} \n*****")
    fig = plot_reference_data(fig)
    if save:
        plt.savefig("coeff_plot.png")
        exit()
    plt.show()
    return

save = False
n_steps = 5000

if "-h" in sys.argv or "--help" in sys.argv:
    print("-h, --help for help")
    print(f"-s to save plot. Does not show plot")
    print(f"add an arbitraty integer to average over that many timesteps. Default is {n_steps} steps. The first integer provided is used.")

if "-s" in sys.argv:
    save = True
for i in sys.argv:
    try: 
        int(i)
        n_steps = int(i)
        print(f"using {n_steps} steps to average")
    except:
        pass

plot_coefficients("./postProcessing/forces", ["Cl", "Cd"], save, n_steps)
