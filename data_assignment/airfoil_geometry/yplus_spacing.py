import math
from scipy.optimize import fsolve

# Script adapted from matlab script provided in AE4202

def flatplate_cf(reynolds):
    return (2 * math.log10(reynolds) - 0.65) ** -2.3

scale = 0.605
segment_length = 0.0168 / scale # line height away from surface
n_points = 75  # number of points normal to surface

reynolds = 2.51e6
u_inf = 63.5  # incoming airspeed
D = scale  # chord length or w/e
wall_spacing = 0.8 #in wall units

rnu = u_inf * D / reynolds  # kinematic viscosity

cf = flatplate_cf(reynolds)

utau = u_inf * math.sqrt(cf/2)  # friction velocity
delta_visc = rnu / utau  # viscous length scale
mesh_spacing = wall_spacing * delta_visc

r = fsolve(lambda x : segment_length * (x-1)/(x**(n_points-1)-1) - mesh_spacing,  1.0001)

print(f"recommended progression: {r[0]:.6f} ")
