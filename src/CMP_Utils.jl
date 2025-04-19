module CMP_Utils

using LinearAlgebra
using MLStyle

using HilbertSpace


include("lattice/uniform_grids_new.jl") # where struct `Lattice` and relevant methods are defined
export Uniform_Grids, Abstract_Uniform_Grids
export dual_basis_vec_mat, dual_basis_vec_list, _k_cart_to_k_crys, _k_cart_to_k_int # export functions


include("single_particle_topology/chern_number.jl") # where method `Chern_number_with_wilson_loop_method` is defined



include("single-particle_basis_system/bloch_system.jl")
export Bloch_System, Basis_System
export LL_bloch_system, tMoTe2_bloch_system


end # module CMP_Utils
