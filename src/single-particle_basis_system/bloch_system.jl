abstract type Basis_System end

"""
Struct `Bloch_System <: Basis_System`
---
- Fields:
    - `bloch_basis::HilbertSpace.Single_Particle_Hilbert_Space`: The single-particle Hilbert space for the Bloch basis.
    - `nband::Int`: The number of bands after splashing all other degrees of freedom (except for the projected flavor).
    - `r_data::Uniform_Grids`: The real-space grids.
    - `k_data::Uniform_Grids`: The BZ momentum grids.
    - `E_nk::Matrix{<:Number}`: A matrix of size `(n,nk)`, where `n` is the number of actual Bloch bands and `nk` is the number of momentum points. The convention is to splash all other degrees of freedom such as valleys/spins, so `n` means actual Bloch band index only if there are no other degrees of freedom.
    - `metadata::Union{NamedTuple,Nothing}`: All left metadata for the Bloch basis. For example, for interacting physics, we may need the scattering momentum grids `q_data`, the flavored single-particle density operator matrix element in Bloch basis: `⟨ψ_{m,[k+q]}|P_f e^{-iq⋅r} P_f|ψ_{n,k}⟩ = Λ_{f,q,k,m,n} ≡ [Λ^f_{q,k}]{m,n}`, and for magnetic Bloch basis we may need to include the magnetic flux, magnetic length, etc.
"""
mutable struct Bloch_System <: Basis_System
    bloch_basis::HilbertSpace.Single_Particle_Hilbert_Space
    nband::Int # number of bands after splashing ALL other dof (except for the projected flavor)
    r_data::Uniform_Grids # real-space grids
    k_data::Uniform_Grids # BZ momentum grids
    E_nk::Matrix{<:Number} # Matrix of size `(n,nk)`. Our convention is to splash ALL other degrees of freedom such as valleys/spins etc. So `n` means actual bloch band index only if there is no other dof

    metadata::Union{NamedTuple,Nothing} # ALL left metadata for the bloch basis. For example for interacting physics we may need the scattering momentum grids `q_data`, the flavored single-particle density operator matrix element (the form factor) in bloch basis: `⟨ψ_{m,[k+q]}|P_f e^{-iq⋅r} P_f|ψ_{n,k}⟩ = Λ_{f,q,k,m,n} ≡ [Λ^f_{q,k}]{m,n}`, and for magnetic bloch basis we may need include the magnetic flux, magnetic length etc.
end

