using LinearAlgebra;

"""

    function cramer(A::Matrix, B::Vector)

Cramer's rule is an explicit formula for the solution of a system of linear equations
with as many equations as unknowns, valid whenever the system has a unique solution.

Function returns solution `x` for a system of `n` unknowns and `n` equations represented as `A * x = B` 

# Arguments:
        - `A` : coeficient matrix
        - 'B' : coeficient vector

"""
function cramer(A::Matrix{T}, B::Vector{T}) where { T <: Number }
    # A must be a square matrix
    (row, col) = size(A);
    if row != col 
        return [];
    end

    # Determinant of A must not be 0
    detA = det(A);
    if detA == 0
        return [];
    end

    x::Vector{Number} = [];
    for i in 1:col
        A_i = copy(A);
        A_i[:, i] = B;

        x_i::Number = det(A_i) / detA;
        push!(x, x_i);
    end

    return x;
end