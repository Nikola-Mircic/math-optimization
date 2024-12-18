using LinearAlgebra;

"""

    function gauss(A::Matrix, B::Vector)

Gaussian elimination, also known as row reduction, is an algorithm for solving systems
of linear equations. It consists of a sequence of row-wise operations performed on the 
corresponding matrix of coefficients.

Function returns solution `x` for a system of `n` unknowns and `n` equations represented as `A * x = B` 

# Arguments:
        - `A` : coeficient matrix
        - 'B' : coeficient vector

"""
function gauss(A::Matrix{T}, B::Vector{T}) where {T <: Number}
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

    S::Matrix{Number} = hcat(A, B);

    for i in 1:row
        _, maxIdx = findmax(abs.(S[i:end, i]));
        maxIdx += i-1;

        if maxIdx != i
            S[i, :], S[maxIdx, :] = S[maxIdx, :], S[i, :];
        end

        for j in i+1:row
            p = S[j,i] / S[i,i];
            S[j, :] -= p .* S[i,:];
        end
    end

    U = S[:, 1:end-1];
    F = S[:, end];

    x = zeros(Number, row, 1);

    x[row] = F[row] / U[row, col];

    for i in row-1:-1:1
        x[i] = F[i];

        for j in i+1:row
            x[i] -= U[i, j] * x[j];
        end

        x[i] /= U[i, i];
    end

    return x;
end