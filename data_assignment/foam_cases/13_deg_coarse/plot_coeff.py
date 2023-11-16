import matplotlib.pyplot as plt
import numpy as np
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
    plt.xlabel("Time [s]")
    plt.ylabel("Coefficient value")
    plt.grid()
    plt.legend()
    plt.tight_layout()
    return fig


def plot_coefficients(filepath, coeffs):
    dirs = [float(i) for i in os.listdir(filepath)]
    dirs.sort()
    dirs = [str(i) for i in dirs]
    try:
        time, coeff_dict = read_data(filepath + "/0/coefficient_0.dat", coeffs)
    except FileNotFoundError:
        time, coeff_dict = read_data(filepath + "/0/coefficient.dat", coeffs)
    for directory in dirs[1:]:
        t, c = read_data(filepath + "/" + directory + "/coefficient.dat", coeffs)
        time = np.append(time, t)
        for coeff in coeff_dict:
            coeff_dict[coeff]  = np.append(coeff_dict[coeff], c[coeff])
    fig = plot_coeff_step(time, coeff_dict)
    plt.show()
    return
    

plot_coefficients("./postProcessing/forces", ["Cl", "Cd"])
