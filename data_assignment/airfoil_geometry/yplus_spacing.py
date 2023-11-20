import math
from scipy.optimize import fsolve

# Script adapted from matlab script provided in AE4202

def flatplate_cf(reynolds):
    return (2 * math.log10(reynolds) - 0.65) ** -2.3


segment_length = 5.0 # line height away from surface
n_points = 128  # number of points normal to surface

reynolds = 6.5e6
u_inf = 1  # incoming airspeed
D = 1  # chord length or w/e
wall_spacing = 200 #in wall units

rnu = u_inf * D / reynolds  # kinematic viscosity

cf = flatplate_cf(reynolds)

utau = u_inf * math.sqrt(cf/2)  # friction velocity
delta_visc = rnu / utau  # viscous length scale
mesh_spacing = wall_spacing * delta_visc

r = fsolve(lambda x : segment_length * (x-1)/(x**(n_points-1)-1) - mesh_spacing,  1.0001)
print(f"recommended progression: {r :.6f} ")
